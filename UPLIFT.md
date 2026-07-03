<!-- uplift:begin 2026-07 -->
# UPLIFT — aresmax-blog · Tier T2 (light) · 2026-07-03

## 1. What this is
Static blog property of the ClawMedia/AresMax web estate (`index.html`, `style.css`, `articles/build-ai-agent-2026/`). Content pipeline is governed by **arescore** (`sites/aresmax-blog/PUBLISHING.md`); publishing normally flows through the swarm, which is **DORMANT BY DECREE** — so the site is frozen content.

## 2. Current state (evidence)
- Remote: `github.com/migar-git/aresmax-blog` (`.git/config`, shallow clone).
- Root: README.md, CLAUDE.md, AGENT.md, AGENTS.md, MEMORY.md, PORTFOLIO.md, index.html + one article; scaffold dirs (agents/, commands/, prompts/, rules/, skills/ — README stubs).

## 3. Safety & honesty gaps
| Item | Status | Note |
|---|---|---|
| README truthful | 🟡 | should state: static site, publishes via arescore pipeline, currently frozen |
| Secrets | ✅ | static HTML/CSS; nothing sensitive observed |
| Remote exists | ✅ | migar-git/aresmax-blog |
| CI cheap | 🔴 | none; an html-validate/link-check action is the whole ask |
| Runbook 5-liner | 🟡 | "how a post ships" lives in arescore PUBLISHING.md — link it |

**Red count: 1.**

## 4. Duplication & consolidation (the 1 slice)
Overlap: aresmaxbot `openclaw/workspace/projects/` holds site workspaces too; content strategy/calendar canonical: **arescore**.
**Slice:** pipeline pointer — README marker block linking `C:\Users\mcgac\Python\arescore\sites\aresmax-blog\PUBLISHING.md` + dormancy note. Gate: `Select-String README.md -Pattern 'PUBLISHING.md'` hits.

## 6. Guard prompt
> Allowed: docs, link fixes, html hygiene. STOP on redesigns. FORBIDDEN: git push; publishing automation; re-enabling swarm cron (10 jobs, `C:\Users\mcgac\.openclaw\cron\jobs.json.migrated`, DORMANT BY DECREE — manual gate: peer remotes + swarm-sync auto-commit risk + Michael).

## 7. Estate hookup
nodex twin: register as web property (content lineage from arescore). MCP/Ollama/evals: none.

## 8. Do-NOT list
- No content authored here directly (arescore calendar/queue owns it).
- No JS/build toolchain adoption for a static site.
- No swarm-cron re-enable; no sandboxed git writes.
<!-- uplift:end -->
