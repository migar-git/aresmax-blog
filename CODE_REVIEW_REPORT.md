# Code Review Report — aresmax-blog

**Generated:** 2026-05-12 (via `/remediate-repo`)
**Reviewer:** Claude Opus 4.7 (Principal Engineer + Security Reviewer + Build/Release Engineer)
**Repo:** `aresmax-blog` (static HTML/CSS/JS blog + docs/) on branch `main`

---

## 1. Executive Summary

The repo is a **content-first static site** (8 HTML pages + 71 markdown docs) deployed to GitHub Pages. It has **no build system**, so traditional compile/test gates do not apply. The active quality gates are the three workflows in `.github/workflows/`:

| Gate | Status before | Status after |
|---|---|---|
| `doc-lint` (frontmatter + markdownlint + link check) | ❌ Would fail any PR touching `docs/` | ✅ 0 errors |
| `swarm-gate` (AGENT.md + AGENTS.md present) | ✅ Both present | ✅ Both present |
| `ai-review` (opt-in, gated on `AI_REVIEW_ENABLED` var) | ⏸ Disabled until var set | ⏸ Unchanged |

**Top risks resolved this iteration:**
- F-0001 — 19 frontmatter violations across 10 doc files (`high`, **fixed**)
- F-0002 — `robots.txt` + `sitemap.xml` claimed in CHANGELOG but missing on disk (`high`, **fixed**)

**Remaining items:**
- F-0003 — `veon` and `vfta` portfolio repos failed `git fetch` during sync (`medium`, needs owner — likely auth/network)
- F-0004 — CSP `'unsafe-inline'` for `script-src` (`low`, won't fix — accepted constraint for static GH Pages)
- F-0005 — No pre-commit hook for doc-lint (`info`, follow-up)

---

## 2. Repo Standards & Compliance Targets

Sources of truth (in precedence order):

1. `CLAUDE.md` — repo conventions (docs/content category, no build system)
2. `AGENT.md` / `AGENTS.md` — swarm assignments + authority ceiling
3. `.github/workflows/doc-lint.yml` — enforces YAML frontmatter shape: `title`, `owner`, `status`, `last_reviewed` (where `status ∈ {Draft, Active, Review, Deprecated, Archived}`)
4. `.markdownlint.json` — `default: true`, with MD013/MD033/MD041 disabled
5. `.github/copilot-instructions.md` — "Never commit secrets, API keys, tokens"
6. `docs/SECURITY.md` — CSP policy + affiliate link safety
7. `docs/TEST_STRATEGY.md` — Lighthouse target ≥ 90 for performance/accessibility/SEO

No recommended baseline needed — repo's existing policies are sufficient.

---

## 3. Detected Tooling & Commands

| Concern | Command |
|---|---|
| Markdown lint | `npx markdownlint-cli2 'docs/**/*.md' '*.md'` |
| Frontmatter check | embedded Python in `.github/workflows/doc-lint.yml` (now mirrored in `run_review.sh`) |
| Internal link check | embedded Python in `.github/workflows/doc-lint.yml` (advisory only) |
| HTML validity (suggested follow-up) | `npx html-validate '*.html' 'articles/**/*.html'` |
| Lighthouse (suggested follow-up, browser-based) | run via Chrome DevTools or Lighthouse CI |

---

## 4. Unfinished/Broken Code Inventory

- **TODO/FIXME/HACK/XXX markers across `*.md`/`*.html`/`*.css`:** 0 (clean)
- **Stubbed/`NotImplemented` patterns:** N/A — static site, no code
- **CHANGELOG drift:** 2 items (robots.txt, sitemap.xml) — fixed in F-0002
- **Frontmatter compliance:** 19 violations → 0 (fixed in F-0001)
- **Broken internal doc links:** 0
- **Detected secrets:** 0 — all `grep` hits were policy text ("never commit secrets…") or example payloads with placeholder values (`'your-api-secret'`, `'your-paper-api-secret'`)

---

## 5. Findings by Severity

| ID | Severity | Category | Title | Status |
|---|---|---|---|---|
| F-0001 | high | build | doc-lint frontmatter — 19 violations across 10 files | fixed |
| F-0002 | high | compliance | CHANGELOG claims robots.txt/sitemap.xml but missing | fixed |
| F-0003 | medium | build | `veon` + `vfta` failed `git fetch` during portfolio sync | needs_owner |
| F-0004 | low | security | CSP allows `'unsafe-inline'` for `script-src` | wont_fix (documented constraint) |
| F-0005 | info | maintainability | No pre-commit hook for doc-lint | open (follow-up) |

Full detail (locations, evidence, remediation) lives in `findings.json` and the per-finding sections of `prompt.md`.

---

## 6. Fix Plan & Sequencing

| Order | Finding | Action | Commit |
|---|---|---|---|
| 1 | F-0001 | Add/repair frontmatter on 10 docs | `fix(F-0001): repair doc-lint frontmatter on 10 docs/**/*.md files` |
| 2 | F-0002 | Add robots.txt + sitemap.xml; note in CHANGELOG | `fix(F-0002): add missing robots.txt and sitemap.xml claimed by CHANGELOG v1.0.0` |
| 3 | (artifacts) | Add CODE_REVIEW_REPORT, findings, prompt, run_review scripts | `chore(remediate-repo): add review artifacts and run_review.{sh,ps1}` |

F-0003 — needs network/auth verification by owner; not actionable inside this run.
F-0004 / F-0005 — documented as won't fix / follow-up.

---

## 7. Verification Plan

```bash
bash run_review.sh --mode verify
```

Expected output:
- Frontmatter check → `errors: 0`
- Internal link check → `=== BROKEN LINKS: 0 ===`
- File presence → `robots.txt OK`, `sitemap.xml OK`
- Exit code → 0 (no open critical/high findings)

---

## 8. Changelog of Fixes

| Commit | Finding | Files |
|---|---|---|
| (this PR) | F-0001 | `docs/ARCHITECTURE.md`, `docs/DEPLOYMENT.md`, `docs/DEVELOPMENT.md`, `docs/MANIFEST.md`, `docs/PRD.md`, `docs/ROADMAP.md`, `docs/RUNBOOK.md`, `docs/SECURITY.md`, `docs/TEST_STRATEGY.md`, `docs/ADR/001-initial-architecture.md` |
| (this PR) | F-0002 | `robots.txt` (new), `sitemap.xml` (new), `CHANGELOG.md` |
| (this PR) | artifacts | `CODE_REVIEW_REPORT.md`, `findings.json`, `prompt.md`, `run_review.sh`, `run_review.ps1`, `artifacts/logs/.gitkeep` |

---

## 9. Open Questions / Needs Owner

- **F-0003** — Why are `veon` and `vfta` failing `git fetch`? Suspected: auth (token rotated) or repo renamed/private. Owner action: `cd ~/DEV/veon && git fetch -v` and capture the exact error.
- **F-0005** — Adopt `.pre-commit-config.yaml`? Trade-off: another tool to maintain vs. catching frontmatter drift earlier than CI.
- Should `unsubscribe.html` be `Disallow:`'d from search engines (currently is in robots.txt) AND have a `<meta name="robots" content="noindex">`? Belt-and-braces approach is recommended but not implemented in this iteration.
