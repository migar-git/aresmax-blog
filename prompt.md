# Remediation Prompt — aresmax-blog

**Generated:** 2026-05-12 by `/remediate-repo`. Maps 1:1 to `findings.json`.

## How to run

```bash
# Discover, review, fix, and verify in sequence
bash run_review.sh --mode all

# Or step-by-step
bash run_review.sh --mode discover
bash run_review.sh --mode review
bash run_review.sh --mode fix
bash run_review.sh --mode verify

# Windows PowerShell equivalent
pwsh ./run_review.ps1 -Mode all
```

Logs are written to `artifacts/logs/run-<timestamp>.log`. Exit code is non-zero in `verify` mode if any critical/high finding remains `open` or `in_progress`.

## Table of Contents

- [F-0001 — doc-lint frontmatter (high, fixed)](#f-0001--doc-lint-frontmatter)
- [F-0002 — Missing robots.txt + sitemap.xml (high, fixed)](#f-0002--missing-robotstxt--sitemapxml)
- [F-0003 — Portfolio fetch failures: veon, vfta (medium, needs_owner)](#f-0003--portfolio-fetch-failures-veon-vfta)
- [F-0004 — CSP unsafe-inline (low, wont_fix)](#f-0004--csp-unsafe-inline)
- [F-0005 — No pre-commit doc-lint hook (info, open)](#f-0005--no-pre-commit-doc-lint-hook)

---

## F-0001 — doc-lint frontmatter (Severity: High | Category: Build)
### Context
`.github/workflows/doc-lint.yml` requires every non-underscored `docs/**/*.md` to carry a YAML frontmatter block with `title`, `owner`, `status`, `last_reviewed`. `status` must be one of `Draft`, `Active`, `Review`, `Deprecated`, `Archived`. 19 violations existed across 10 files: 6 had no frontmatter, 3 had legacy schema (`prd-version`/`last-updated`/`status: "Current"`), and PRD.md was missing only `last_reviewed`.

### Required Changes
1. Add full frontmatter block to: `docs/ARCHITECTURE.md`, `docs/DEPLOYMENT.md`, `docs/RUNBOOK.md`, `docs/SECURITY.md`, `docs/TEST_STRATEGY.md`, `docs/ADR/001-initial-architecture.md`.
2. Migrate legacy frontmatter on: `docs/DEVELOPMENT.md`, `docs/MANIFEST.md`, `docs/ROADMAP.md` — add the four required fields and keep `prd-version` for downstream consumers.
3. Add `last_reviewed: "2026-05-12"` to `docs/PRD.md`.

### Acceptance Criteria
- [x] Frontmatter validator from `doc-lint.yml` returns `errors: 0`
- [x] No file regresses the `status` enum
- [x] PRD.md retains its existing `version`, `owner`, `status`, `last-updated`

### Verification
- Command: `bash run_review.sh --mode verify`
- Expected: `errors: 0`

### Commit Guidance
- Message: `fix(F-0001): repair doc-lint frontmatter on 10 docs/**/*.md files`
- Notes: single commit covering all 10 files — they share a single class of fix.

### Rollback
- `git revert` of the commit; no data loss since legacy fields were preserved.

---

## F-0002 — Missing robots.txt + sitemap.xml (Severity: High | Category: Compliance)
### Context
`CHANGELOG.md` v1.0.0 (line 14) claims `robots.txt and sitemap.xml` shipped, but neither file existed on disk. This is a content-first SEO-driven site (per `docs/PRD.md` and `docs/TEST_STRATEGY.md` Lighthouse SEO target ≥ 90), so crawlers without sitemap discovery is a real penalty.

### Required Changes
1. Create `robots.txt` at repo root with `Allow: /`, `Disallow: /unsubscribe.html`, and `Sitemap:` pointing to the canonical URL.
2. Create `sitemap.xml` listing 7 indexable URLs (root + store + 5 articles); exclude `unsubscribe.html`.
3. Note the fix under `## [Unreleased] / ### Added` in `CHANGELOG.md`.

### Acceptance Criteria
- [x] `robots.txt` exists at repo root
- [x] `sitemap.xml` exists at repo root, well-formed XML
- [x] `unsubscribe.html` is NOT listed in the sitemap and IS in `Disallow`

### Verification
- Command: `ls robots.txt sitemap.xml && xmllint --noout sitemap.xml 2>/dev/null && echo OK`
- Expected: `OK` (xmllint validation optional — if missing, just check files exist)

### Commit Guidance
- Message: `fix(F-0002): add missing robots.txt and sitemap.xml claimed by CHANGELOG v1.0.0`

### Rollback
- `git revert`. No production traffic implication; absent sitemap simply means slower indexing.

---

## F-0003 — Portfolio fetch failures: veon, vfta (Severity: Medium | Category: Build)
### Context
`/agency-repo-sync` returned 48 CLEAN repos and 2 failures: `WARN fetch failed veon` and `WARN fetch failed vfta`. Root cause unknown without manual verification.

### Required Changes
1. Owner: `cd ~/DEV/veon && git fetch -v 2>&1 | head -20` — capture the actual error.
2. Owner: `cd ~/DEV/vfta && git fetch -v 2>&1 | head -20`.
3. Decide: re-clone, fix remote URL, refresh `gh auth`, or remove from portfolio.

### Acceptance Criteria
- [ ] Next `/agency-repo-sync` run returns 0 failures, OR
- [ ] Both repos formally archived to `~/.claude/graveyard/` if no longer maintained.

### Verification
- Command: `bash ~/DEV/myskills/scripts/agency-repo-sync.sh 2>&1 | grep -E "Failed|FAIL"`
- Expected: `Failed 0`

### Commit Guidance
- N/A in this repo. Owner action is portfolio-level.

### Rollback
- N/A.

---

## F-0004 — CSP unsafe-inline (Severity: Low | Category: Security)
### Context
`index.html` (and other HTML pages) ship a CSP with `script-src 'self' 'unsafe-inline'`. `docs/SECURITY.md` already acknowledges this and notes "tighten to nonce if possible". On a static GitHub Pages site with no server-side rendering, nonces can't be issued per request, so this is an accepted trade-off.

### Required Changes
- None this iteration. Tracked as `wont_fix`.

### Acceptance Criteria
- [x] Constraint documented in `docs/SECURITY.md` (already true).

### Verification
- N/A.

### Commit Guidance
- N/A.

### Rollback
- N/A.

---

## F-0005 — No pre-commit doc-lint hook (Severity: Info | Category: Maintainability)
### Context
The `doc-lint` workflow only runs in CI. A contributor can commit broken frontmatter and only discover it after pushing. Adding `.pre-commit-config.yaml` would catch it locally.

### Required Changes
1. Add `.pre-commit-config.yaml` with hooks for `markdownlint-cli2` and the frontmatter check.
2. Add a `pre-commit install` step to `docs/DEVELOPMENT.md`.

### Acceptance Criteria
- [ ] `pre-commit run --all-files` mirrors what `doc-lint.yml` runs in CI.

### Verification
- Command: `pre-commit run --all-files`
- Expected: same pass/fail as CI.

### Commit Guidance
- Message: `chore(F-0005): add pre-commit hook for doc-lint`
- Out of scope for this iteration; queued as follow-up.

### Rollback
- `git revert` + `pre-commit uninstall`.
