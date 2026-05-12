# run_review.ps1 — PowerShell parity for run_review.sh
# Usage: pwsh ./run_review.ps1 -Mode all
param(
  [ValidateSet("discover","review","fix","verify","all")]
  [string]$Mode = "all"
)

$ErrorActionPreference = "Stop"
$LogDir = "./artifacts/logs"
New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
$Log = Join-Path $LogDir ("run-{0}.log" -f (Get-Date -Format "yyyyMMdd-HHmmss"))
Start-Transcript -Path $Log -Append | Out-Null

function Invoke-Discover {
  Write-Host "---- discover ----"
  Write-Host ("Repo: {0}" -f (Split-Path -Leaf (Get-Location)))
  $branch = (git symbolic-ref --short HEAD 2>$null)
  Write-Host ("Default branch: {0}" -f $branch)
  $md = (Get-ChildItem -Recurse -Filter *.md -File | Where-Object { $_.FullName -notmatch "\\.git\\" }).Count
  $html = (Get-ChildItem -Recurse -Filter *.html -File | Where-Object { $_.FullName -notmatch "\\.git\\" }).Count
  Write-Host ("MD files: {0}" -f $md)
  Write-Host ("HTML files: {0}" -f $html)
}

function Invoke-Review {
  Write-Host "---- review ----"
  python3 -c @"
import sys, re
from pathlib import Path
REQUIRED = ['title','owner','status','last_reviewed']
VALID = {'Draft','Active','Review','Deprecated','Archived'}
errs = []
for p in Path('docs').rglob('*.md'):
    if p.name.startswith('_'): continue
    t = p.read_text(encoding='utf-8', errors='ignore')
    m = re.match(r'^---\n(.*?)\n---', t, re.DOTALL)
    if not m: errs.append(f'{p}: missing frontmatter'); continue
    fm = m.group(1)
    for f in REQUIRED:
        if not re.search(rf'^{f}:', fm, re.MULTILINE): errs.append(f'{p}: missing {f}')
    s = re.search(r'^status:\s*(.+)$', fm, re.MULTILINE)
    if s and s.group(1).strip().strip('"') not in VALID:
        errs.append(f'{p}: invalid status')
print(f'errors: {len(errs)}')
[print(e) for e in errs]
sys.exit(1 if errs else 0)
"@
}

function Invoke-Verify {
  Invoke-Review
  python3 -c @"
import json, sys
d = json.load(open('findings.json'))
oh = [f for f in d['findings'] if f['severity'] in ('critical','high') and f['status'] in ('open','in_progress')]
if oh:
    print(f'FAIL: {len(oh)} critical/high findings still open')
    for f in oh: print(f'  {f[\"id\"]} ({f[\"severity\"]}) {f[\"title\"]}')
    sys.exit(1)
print('PASS: 0 critical/high findings open')
"@
}

switch ($Mode) {
  "discover" { Invoke-Discover }
  "review"   { Invoke-Review }
  "fix"      { Write-Host "fix: in-place edits already applied (see findings.json)" }
  "verify"   { Invoke-Verify }
  "all"      { Invoke-Discover; Invoke-Review; Invoke-Verify }
}

Stop-Transcript | Out-Null
