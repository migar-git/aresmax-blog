#!/usr/bin/env bash
# run_review.sh — reproduce the /remediate-repo gates for aresmax-blog locally.
#
# Modes:
#   discover  — print stack detection + finding inventory
#   review    — re-run the validators that produced findings.json
#   fix       — no-op (fixes are applied in-place via Edit; included for parity)
#   verify    — run the gates; exit non-zero if any critical/high finding is still open
#   all       — discover → review → verify
#
# Usage: bash run_review.sh --mode all

set -euo pipefail

MODE="${1:-all}"
case "${1:-}" in
  --mode) MODE="${2:-all}"; shift 2 ;;
  --mode=*) MODE="${1#--mode=}"; shift ;;
esac

LOG_DIR="./artifacts/logs"
mkdir -p "$LOG_DIR"
LOG="$LOG_DIR/run-$(date +%Y%m%d-%H%M%S).log"
exec > >(tee -a "$LOG") 2>&1

echo "==== run_review.sh — mode=$MODE — $(date '+%Y-%m-%d %H:%M:%S') ===="

discover() {
  echo "---- discover ----"
  echo "Repo: $(basename "$PWD")"
  echo "Default branch: $(git symbolic-ref --short HEAD 2>/dev/null || echo unknown)"
  echo "MD files: $(find . -path ./.git -prune -o -name '*.md' -print | wc -l)"
  echo "HTML files: $(find . -path ./.git -prune -o -name '*.html' -print | wc -l)"
  echo "Detected build commands: (none — static content repo)"
  echo "Detected test commands: markdownlint + frontmatter validator + link checker (from .github/workflows/doc-lint.yml)"
}

review() {
  echo "---- review: frontmatter ----"
  python3 - << 'PYEOF'
import sys, re
from pathlib import Path
REQUIRED = ["title","owner","status","last_reviewed"]
VALID = {"Draft","Active","Review","Deprecated","Archived"}
errs = []
for p in Path("docs").rglob("*.md"):
    if p.name.startswith("_"): continue
    t = p.read_text(encoding="utf-8", errors="ignore")
    m = re.match(r"^---\n(.*?)\n---", t, re.DOTALL)
    if not m: errs.append(f"{p}: missing frontmatter"); continue
    fm = m.group(1)
    for f in REQUIRED:
        if not re.search(rf"^{f}:", fm, re.MULTILINE):
            errs.append(f"{p}: missing {f}")
    s = re.search(r"^status:\s*(.+)$", fm, re.MULTILINE)
    if s and s.group(1).strip().strip('"') not in VALID:
        errs.append(f"{p}: invalid status '{s.group(1).strip()}'")
print(f"errors: {len(errs)}")
for e in errs: print(e)
sys.exit(1 if errs else 0)
PYEOF

  echo "---- review: internal links ----"
  python3 - << 'PYEOF'
import re
from pathlib import Path
warnings = []
for path in Path("docs").rglob("*.md"):
    text = path.read_text(encoding="utf-8", errors="ignore")
    for m in re.finditer(r"\[.*?\]\(([^)]+)\)", text):
        href = m.group(1)
        if href.startswith(("http","#","mailto")): continue
        if not (path.parent / href).resolve().exists():
            warnings.append(f"{path}: broken link -> {href}")
print(f"=== BROKEN LINKS: {len(warnings)} ===")
for w in warnings: print(w)
PYEOF

  echo "---- review: file presence ----"
  for f in robots.txt sitemap.xml index.html CHANGELOG.md; do
    if [ -f "$f" ]; then echo "OK    $f"; else echo "MISS  $f"; fi
  done
}

verify() {
  review
  echo "---- verify: open critical/high findings ----"
  python3 - << 'PYEOF'
import json, sys
data = json.load(open("findings.json"))
open_high = [f for f in data["findings"]
             if f["severity"] in ("critical","high") and f["status"] in ("open","in_progress")]
if open_high:
    print(f"FAIL: {len(open_high)} critical/high findings still open:")
    for f in open_high:
        print(f"  {f['id']} ({f['severity']}) {f['title']}")
    sys.exit(1)
print("PASS: 0 critical/high findings open")
PYEOF
}

case "$MODE" in
  discover) discover ;;
  review)   review ;;
  fix)      echo "fix: in-place edits already applied (see findings.json commitRefs)" ;;
  verify)   verify ;;
  all)      discover; review; verify ;;
  *) echo "Unknown mode: $MODE"; exit 2 ;;
esac

echo "==== done — log: $LOG ===="
