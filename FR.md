# Aresmax-Blog Feature Requests

<!-- REGROUND:reground-20260815-python-fleet:BEGIN -->

## Re-Grounding 2026-08-15 — Autonomous Fleet Pass

> **Run:** `reground-20260815-python-fleet` · **Method:** static forensic recon of all 59 git repos under `C:\Users\mcgac\Python`
> (tree + manifests + compose + git metadata + targeted greps via Windows-MCP; **no code executed this pass**).
> **Execution contract:** [`FRSP.md`](FRSP.md) — the resident self-agent system prompt generated alongside this block.

### Verified identity (2026-08-15)

Aresmax project blog + lightweight digital-product store (static, 8 pages): SEO fundamentals complete, CSP meta, structured docs/ governance tree (01-business..10-governance).

### Evidence snapshot

| Field | Value |
|---|---|
| Class | Static/managed website |
| Branch @ recon | `main` |
| Last commit observed | 2026-07-27 |
| Stack | Static HTML/CSS; 3 workflows (doc-lint, frontmatter, ai-review) |
| Ports/services declared | none declared |
| Test posture | doc-lint family |
| LLM posture | CI-level |
| MCP posture | n/a |
| Dashboard posture | arescore registration |

### Prior-content status

The body below this block is the prior audit register (last authored ~2026-07-03/04, 231 lines). It is preserved verbatim per the fleet data-retention law. Every claim in it is now classified **STALE-UNVERIFIED** until re-proven by the FRSP execution loop — the repo has moved (last commit 2026-07-27).

### Universal mandate assessment (fleet standard M-01..M-10)

| ID | Mandate | Status | Evidence / note |
|---|---|---|---|
| M-01 | Repo self-agent | PARTIAL | AGENT.md/CLAUDE.md governance present fleet-wide; FRSP.md (this pass) is now the executable self-agent contract |
| M-02 | Local-LLM capability (via canonical provider) | N-A/CI-LEVEL | LLM used in CI/build lanes only — correct for this repo class; runtime consumption not required |
| M-03 | Local-LLM management reachable | N-A | Managed centrally by olaman; this repo consumes nothing at runtime |
| M-04 | MCP surface | N-A | n/a |
| M-05 | 3-click dashboard access | PARTIAL | arescore registration; 3-click rule unproven — audit required |
| M-06 | Dedup/consolidate/reuse | OPEN | 1 directive(s) — see FRSP.md §5 |
| M-07 | 100% coverage, all green/clean | UNPROVEN | doc-lint family — no verified 100% run on record |
| M-08 | Live operational validation | UNVERIFIED | This pass was static (no code executed); runtime proof owed by FRSP execution |
| M-09 | Traceability & auditability | MINIMAL | Observability signals vary; correlation-ID + decision-record standard mandated |
| M-10 | Total data retention | POLICY-SET | Retention law encoded in FRSP.md §12; archive-never-destroy from this date |

### Deduplication / consolidation directives (repo-specific)

- **DD-01:** Site-kit extraction

### Re-grounded gap register (adds to, never replaces, the register below)

- **RG-01:** Content pipeline: blog generation via local models (build-time)

### Fleet context this repo must honor

- Canonical local-LLM provider: **olaman (Ollama gateway/control plane, port 8030) fronting host Ollama at 127.0.0.1:11434**
- Canonical fleet dashboard/command center: **arescore (ClawMedia command center, app/server.js :8889; Arescore hub seed http://127.0.0.1:8890/)**
- Canonical skills SSOT: **agency (SSOT skill registry, 708-skill capability manifest)**
- Known fleet port collisions (resolve via the arescore port registry): 8030: olaman vs dev-analytics api; 8741: freeai backend vs myskills; 8000: mia, lab, peni, myprd backends (+fira internal); 8028: fira frontend vs midas (full list in FRSP.md §1)

<!-- REGROUND:reground-20260815-python-fleet:END -->


## Review Metadata

- **Review date:** 2026-07-03
- **Repo root:** `C:\Users\mcgac\Python\aresmax-blog` (bash mirror: `/sessions/epic-tender-pasteur/mnt/Python/aresmax-blog/`)
- **Languages/frameworks:** Static HTML5/CSS3, no client-side framework, no build tooling, no package.json. Deployed via GitHub Pages (implied by `og:url`/canonical URLs pointing at `migar-git.github.io/aresmax-blog`).
- **App type:** Content marketing blog + lightweight digital-product store (static site). Confirmed via `docs/PRD.md`/`docs/TEST_STRATEGY.md` framing and zero server-side code found. This matches the assignment's "web-appropriate FR" expectation.
- **Review mode:** Blitz — single-session, sampled evidence.
- **Commands run:** No code execution, installs, or git mutations performed (hard rule). `mcp__workspace__bash` was contended (`RPC error -1: process already running`) after the aresdock review, so this repo was inspected entirely via `Glob`/`Grep`/`Read` file tools, per the instruction that file tools are sufficient.
- **Tests/CI discovered:** Three GitHub Actions workflows — `doc-lint.yml` (markdownlint + YAML-frontmatter validation + advisory broken-internal-doc-link check, scoped to `docs/**` and `*.md`), `ai-review.yml` (AI-assisted doc-quality gate gated behind `AI_REVIEW_ENABLED` repo variable, references `scripts/ai-review.sh` which does not exist in the repo — falls back to an echo message), and `swarm-gate.yml` (validates presence/schema of `AGENT.md`/`AGENTS.md` governance files — an internal fleet-registration check, not a site-quality gate). **No workflow tests the actual website** (no HTML validation, no Lighthouse, no accessibility audit, no link-checker, no visual regression), despite `docs/TEST_STRATEGY.md` explicitly specifying all of these as required test categories.
- **Confidence:** High — the site is small (8 HTML pages, 1 CSS file, no JS beyond 2 inline forms) and was read in full or near-full; the repo also contains a prior self-audit (`findings.json`, dated 2026-05-12) whose unresolved/wont_fix items independently corroborate several findings below.

## Existing Capabilities Found

- **SEO fundamentals:** Every page has a unique `<title>`, meta description, meta keywords, canonical link, Open Graph tags, and Twitter Card tags. `sitemap.xml` lists all 7 indexable pages with `lastmod`/`changefreq`/`priority`. `robots.txt` allows crawling and correctly disallows `/unsubscribe.html` while pointing crawlers at the sitemap. At least one article (`build-ai-agent-2026/index.html`) includes Schema.org `Article` JSON-LD structured data.
- **Security headers (meta-tag level):** A Content-Security-Policy is set via `<meta http-equiv>` consistently across all 8 HTML pages (`default-src 'self'`, restrictive `object-src 'none'`, allowlisted Google Fonts domains). `docs/SECURITY.md` documents the policy and its known `unsafe-inline` tradeoff (explicitly accepted as `wont_fix` per `findings.json` F-0004, appropriate for a static site with no user-generated content).
- **Documentation governance:** A structured `docs/` tree (numbered 01-business through 10-governance) with an ADR log, PRD, deployment/runbook/test-strategy docs, all carrying YAML frontmatter (title/owner/status/last_reviewed) enforced by CI.
- **Self-audit process:** `findings.json` shows an existing, dated internal review already caught and fixed two high-severity issues (missing robots.txt/sitemap.xml, frontmatter violations) — evidence of an active quality process, not a neglected repo.
- **AI-agent operating scaffolding:** `agents/`, `rules/`, `prompts/`, `skills/`, `commands/` directories define prompts and playbooks for AI coding agents (Claude/Codex/VSCode) working on this repo, plus `AGENT.md`/`AGENTS.md` governance files validated by `swarm-gate.yml`. This is meta-tooling for how the repo is maintained, not part of the delivered product.
- **Content:** 5 published articles plus a digital-product store page with Stripe (test-mode) purchase links and an email-capture/unsubscribe flow.

## Evidence Ledger

| Evidence ID | Area | Evidence Type | File/Path/Command | Finding | Confidence |
|---|---|---|---|---|---|
| EV-01 | Test strategy vs. CI reality | Read | `docs/TEST_STRATEGY.md` §1–4 vs. `.github/workflows/*.yml` | TEST_STRATEGY.md mandates Lighthouse (Perf/A11y/Best-Practices ≥90, SEO ≥95), axe DevTools accessibility testing, `linkinator` link-checking, and Stripe test-mode payment-flow testing "before every push" / "monthly" — none of these appear in any of the 3 discovered workflows | High |
| EV-02 | Unsubscribe endpoint | Read | `unsubscribe.html` line 46 | Form posts to `http://192.168.0.219:8586/unsubscribe` — a private LAN IP over plain HTTP, hardcoded in publicly-shipped page source; non-functional for any visitor outside that local network and contradicts `docs/SECURITY.md`'s own requirement that "unsubscribe.html must remain accessible and functional" | High |
| EV-03 | Webhook/URL exposure | Read | `unsubscribe.html` line 46; `docs/SECURITY.md` line 36 | `docs/SECURITY.md` explicitly instructs "Do not embed... Webhook URLs in publicly visible code" — the unsubscribe form's backend URL is embedded in plain visible JS in the shipped HTML, a direct doc-vs-code contradiction | High |
| EV-04 | CI workflow coverage | Read | `.github/workflows/ai-review.yml`, `doc-lint.yml`, `swarm-gate.yml` | All 3 workflows govern documentation/agent-metadata, not the website itself; `ai-review.yml` references `scripts/ai-review.sh`, confirmed absent via Glob, so its cloud-provider branch always no-ops | High |
| EV-05 | Broken-link checking | Read | `doc-lint.yml` "Check for broken internal doc links" step | Only checks links **inside** `docs/**/*.md`; does not check links inside the actual HTML pages (`index.html`, `articles/*.html`, `store.html`) that visitors see, and is explicitly "Advisory only — broken links do not block the PR" | High |
| EV-06 | Accessibility | Grep | `alt=` and `aria-`/`role=` across `*.html` | Zero `<img>` tags exist site-wide (0 matches), so missing alt-text is not itself a defect; however only 1 `aria-` attribute found across all 8 pages (the email input's `aria-label` on the homepage subscribe form) — the store and unsubscribe forms have no equivalent labeling, and no automated accessibility check exists to catch future regressions | Medium |
| EV-07 | License | Glob | `LICENSE*` at repo root | No LICENSE file found | High |
| EV-08 | Code ownership | Glob | `CODEOWNERS` at repo root and `.github/` | No CODEOWNERS file found | High |
| EV-09 | Pre-commit hooks | Glob + `findings.json` | `.pre-commit-config.yaml` (absent); `findings.json` F-0005 | No pre-commit config exists; the repo's own prior audit already flagged this as open/unaddressed ("No local pre-commit hook for markdownlint / frontmatter checks — drift can re-occur") | High |
| EV-10 | Payment flow | Grep | `store.html` lines 78–148 | All 6 product links point to `buy.stripe.com/test_...` (Stripe test-mode URLs); no evidence of live/production payment links, and no automated test validates the checkout flow despite `docs/TEST_STRATEGY.md` §4 requiring it | Medium |
| EV-11 | HTTP security headers beyond CSP | Grep | `X-Frame-Options\|X-Content-Type\|Strict-Transport\|Permissions-Policy\|Referrer-Policy` across repo | No matches; GitHub Pages static hosting does not allow setting real HTTP response headers (only `<meta>`-settable ones like CSP apply), so this is a platform constraint rather than a pure code gap, but no `_headers`/Cloudflare/alternate-hosting mitigation was found either | Medium — platform-constrained, included as a migration-dependent FR |
| EV-12 | Visual regression / cross-browser | Read | `docs/TEST_STRATEGY.md` §6, §9 | Playwright screenshot-based visual regression and cross-browser (Chrome/Firefox/Safari/Edge) testing are specified but no Playwright config, script, or CI job exists in the repo | High |

## Threat Model Summary (STRIDE-brief)

- **Spoofing:** Low relevance for a static content site with no authentication.
- **Tampering:** CSP with `object-src 'none'` reduces injection risk; `unsafe-inline` for scripts is an accepted, documented tradeoff (no server-rendered user input path exists to exploit it).
- **Repudiation:** N/A — no transactional user actions are logged server-side (site is static).
- **Information Disclosure:** The unsubscribe form's hardcoded private-network API URL (EV-02/EV-03) is the standout finding — while a LAN IP isn't reachable from the internet (so it doesn't leak data to attackers), embedding what functions as an internal service endpoint in public page source is exactly the pattern `docs/SECURITY.md` warns against, and independently the endpoint being unreachable means the feature silently fails for real users, which is itself a compliance risk (CAN-SPAM/GDPR-style unsubscribe obligations depend on this working).
- **Denial of Service:** Minimal — static site on GitHub Pages CDN.
- **Elevation of Privilege:** N/A — no privilege model exists on a static site.

## AI Governance Summary

Not applicable as a product capability — this repository does not ship an AI/agentic product feature to end users. The `agents/`, `rules/`, `prompts/`, `skills/` directories and `ai-review.yml` workflow are meta-tooling governing how AI coding assistants (Claude, Codex, GitHub Copilot) contribute to this repo, not an AI feature of the blog/store itself. No FRs are raised in this category per the instruction to only include AI-governance FRs "if present" as a product capability.

## Competitive Benchmark Matrix

| Capability | Aresmax-Blog (verified) | Typical static-site competitor baseline |
|---|---|---|
| SEO meta/sitemap/robots | Present and consistent across all pages | Standard expectation — met |
| Automated Lighthouse/perf gate | **Missing** (documented, not implemented) | Common via `lighthouse-ci` GitHub Action on Netlify/Vercel-hosted blogs |
| Automated accessibility audit | **Missing** (documented, not implemented) | `axe-core` CI integration is a common baseline for content sites in 2026 |
| Broken-link checking (site-wide) | **Missing** for HTML content (only doc-internal links checked, advisory-only) | `linkinator`/`lychee` CI jobs are common for content-heavy static sites |
| License clarity | **Missing** | Most public-facing GitHub repos include a LICENSE even for content sites |
| Functional unsubscribe/compliance flow | **Broken** (points to unreachable LAN endpoint) | CAN-SPAM/GDPR compliance requires a working, tested unsubscribe path |

## Gap Analysis Summary

The site's on-page SEO and CSP hygiene are genuinely solid and need no further work. The verified gaps cluster tightly around one theme: **the repo's own documentation (`docs/TEST_STRATEGY.md`, `docs/SECURITY.md`) specifies a test/security bar that the actual CI and code do not meet.** Three of the 3 CI workflows govern documentation and AI-agent metadata, none govern the shipped website; the unsubscribe flow — a functional and compliance-relevant feature — is broken by a hardcoded unreachable endpoint; and baseline repo hygiene items (LICENSE, CODEOWNERS, pre-commit hooks) are absent, the last of which the repo's own prior self-audit already flagged and left open.

## Feature Requests

### FR-001

**Description:** Add a Lighthouse CI job (e.g., `treosh/lighthouse-ci-action` or `lighthouse-ci` npm package) that runs against the deployed GitHub Pages URL (or a local static server) on a schedule and/or on PRs touching HTML/CSS, enforcing the Performance ≥90, Accessibility ≥90, Best Practices ≥90, and SEO ≥95 thresholds already specified in `docs/TEST_STRATEGY.md` §1.
**Why It Matters:** This is the repo's own "Primary Quality Gate" per its test strategy, with an explicit manual command (`npx lighthouse ...`) documented — but no CI job runs it. The gate exists on paper only, so a regression in performance, accessibility, or SEO would ship undetected.
**Verification Evidence:** `docs/TEST_STRATEGY.md` lines 16–31 specify the exact thresholds and command; `.github/workflows/` contains only `doc-lint.yml`, `ai-review.yml`, `swarm-gate.yml`, none of which invoke Lighthouse (EV-01).
**Evidence IDs:** EV-01
**Priority:** P0
**Category:** Web Quality / SEO / Performance
**ROI Score:** 8/10 — SEO ≥95 and performance gates directly affect organic traffic (this is a content-monetization site whose business model depends on search visibility and reader experience), and the implementation cost is a single well-documented CI action.
**Risk Score:** 3/10 — low complexity (drop-in GitHub Action), no breaking change to existing site, purely additive.
**Dependencies:** None — can run against the live GitHub Pages URL directly, no local build step needed since this is a static site.
**Competitive Reference:** Standard practice for content/marketing sites in 2026; comparable to how Sentry/Datadog dashboards gate release health, applied here to page-quality health.
**Security/Privacy Impact:** None directly; Best Practices category in Lighthouse does catch some security-adjacent issues (e.g., mixed content, deprecated APIs).
**Rollout Readiness:** High — the exact command to wrap in CI is already documented in the repo.
**Validation Gates:** (1) CI job runs successfully against the live URL and produces a report artifact; (2) a deliberately-degraded test page (e.g., oversized unoptimized image) causes the gate to fail; (3) thresholds match `docs/TEST_STRATEGY.md` exactly (Perf/A11y/BP ≥90, SEO ≥95).
**Acceptance Criteria:** (1) A new workflow (e.g., `.github/workflows/lighthouse.yml`) runs on a schedule (per TEST_STRATEGY's "Monthly" cadence) and/or on relevant PRs; (2) the job fails when any category drops below its documented threshold; (3) a human-readable report is attached as a workflow artifact or PR comment; (4) `docs/TEST_STRATEGY.md` is updated to reference the now-automated (not manual-only) process.

### FR-002

**Description:** Fix the unsubscribe form in `unsubscribe.html` to point at a reachable, production-appropriate HTTPS endpoint instead of the hardcoded private LAN address `http://192.168.0.219:8586/unsubscribe`, and add a CI or pre-deploy check that fails the build if any shipped page references a private/non-routable IP address.
**Why It Matters:** As currently written, the unsubscribe feature — a legally/compliance-relevant capability per `docs/SECURITY.md`'s own requirement that it "must remain accessible and functional" — cannot work for any real visitor, since a private LAN IP is unreachable from the public internet. This also technically violates the same doc's instruction not to embed webhook URLs in publicly visible code.
**Verification Evidence:** Read of `unsubscribe.html` line 46 (`const API_URL = 'http://192.168.0.219:8586/unsubscribe';`) (EV-02, EV-03); `docs/SECURITY.md` lines 27–36 states the functional and secrecy requirements this violates.
**Evidence IDs:** EV-02, EV-03
**Priority:** P0
**Category:** Functional Defect / Compliance
**ROI Score:** 6/10 — directly affects legal/compliance posture (unsubscribe obligations under anti-spam regulation) for a site actively running an email list; low effort to redirect to a real endpoint.
**Risk Score:** 7/10 — a broken opt-out mechanism is a compliance risk (CAN-SPAM-style requirements expect a functioning unsubscribe path), and the current code pattern (hardcoded internal-looking URL in public source) is exactly the anti-pattern the repo's own security doc warns against.
**Dependencies:** Requires deciding on the actual production unsubscribe backend (the LAN IP suggests a local dev service was accidentally left in) — this is a configuration/deployment fix, not a large build.
**Competitive Reference:** Any compliant email marketing operation (Mailchimp, ConvertKit-style unsubscribe flows) uses a publicly reachable HTTPS endpoint.
**Security/Privacy Impact:** Closes a doc-vs-code contradiction around exposing internal infrastructure URLs in public source; ensures user opt-out requests are actually honored.
**Rollout Readiness:** High for the fix itself (URL swap); Medium for the accompanying CI guard (needs a private-IP-pattern regex check).
**Validation Gates:** (1) Manual test confirms the unsubscribe form successfully reaches the real endpoint and processes a test request; (2) a new CI step scans shipped HTML for RFC 1918 private-IP patterns and fails if found; (3) `docs/SECURITY.md`'s "must remain accessible and functional" requirement is verifiably true post-fix.
**Acceptance Criteria:** (1) `unsubscribe.html`'s `API_URL` points to a publicly reachable HTTPS endpoint; (2) a test submission from outside the original LAN successfully unsubscribes a test address; (3) CI includes a check that fails the build if a private/non-routable IP literal appears in any shipped HTML/JS file; (4) the fix is noted in `CHANGELOG.md`.

### FR-003

**Description:** Add an automated accessibility audit (axe-core via `@axe-core/cli` or a Lighthouse-accessibility-category equivalent) to CI, covering the homepage, `store.html`, and at least one article page, per `docs/TEST_STRATEGY.md` §2's explicit requirement.
**Why It Matters:** `docs/TEST_STRATEGY.md` mandates axe DevTools testing on three specific page types with concrete pass criteria (4.5:1 contrast, keyboard navigation), but this review found only a single `aria-label` across all 8 pages and no automated check of any kind — accessibility regressions (e.g., low-contrast text added in a future edit, unlabeled form fields) would ship silently.
**Verification Evidence:** `docs/TEST_STRATEGY.md` lines 33–38; Grep for `aria-|role=` across all `*.html` returned exactly 1 hit (homepage subscribe input) (EV-06); no accessibility-testing tool or config found anywhere in the repo.
**Evidence IDs:** EV-06, EV-01
**Priority:** P1
**Category:** Accessibility (a11y)
**ROI Score:** 6/10 — trust/UX-weighted: accessibility compliance broadens addressable readership and reduces legal exposure (ADA/WCAG-adjacent risk for U.S.-facing content sites), moderate effort to wire in.
**Risk Score:** 4/10 — low technical complexity; the store and unsubscribe forms in particular (both take user input) currently have the thinnest labeling and are the highest-value targets.
**Dependencies:** Can piggyback on the Lighthouse CI job from FR-001 (Lighthouse includes an Accessibility category) or run as a standalone axe-core step for finer-grained WCAG rule reporting.
**Competitive Reference:** Standard for content-forward sites; WCAG 2.2 AA is the common target referenced by most 2026-era accessibility tooling defaults.
**Security/Privacy Impact:** None directly.
**Rollout Readiness:** High — axe-core CLI or Lighthouse-a11y integration is low-friction against a static site.
**Validation Gates:** (1) CI job runs against homepage, store, and one article page; (2) a deliberately introduced low-contrast text change or unlabeled input causes the job to fail; (3) existing pages pass the initial baseline run (or documented exceptions are filed).
**Acceptance Criteria:** (1) An automated accessibility check runs in CI against the three page types specified in `docs/TEST_STRATEGY.md`; (2) the store and unsubscribe form inputs carry appropriate `aria-label`/`<label>` associations; (3) the job is documented as satisfying `docs/TEST_STRATEGY.md` §2 (updating that doc from aspirational to implemented).

### FR-004

**Description:** Add a site-wide broken-link checker (e.g., `linkinator` or `lychee`) run against the deployed GitHub Pages URL, covering all HTML pages (not just `docs/**/*.md`), per `docs/TEST_STRATEGY.md` §3's explicit specification and command.
**Why It Matters:** The only existing link check (`doc-lint.yml`'s "Check for broken internal doc links" step) is scoped exclusively to markdown files under `docs/`, is explicitly advisory-only (does not block PRs), and does not check the actual content pages visitors read (`index.html`, 5 articles, `store.html`) or outbound/affiliate links `docs/TEST_STRATEGY.md` calls out as requiring verification.
**Verification Evidence:** `docs/TEST_STRATEGY.md` lines 40–50 specify the exact `linkinator` command and scope (article links, store CTAs, unsubscribe links, social/outbound links); `doc-lint.yml`'s link-check step (lines 64–89) is scoped to `docs_dir.rglob("*.md")` only and is commented "Advisory only — broken links do not block the PR" (EV-05).
**Evidence IDs:** EV-05, EV-01
**Priority:** P1
**Category:** Web Quality / Reliability
**ROI Score:** 5/10 — protects reader trust and SEO (broken links hurt both UX and search ranking signals); low implementation cost given the exact command is already documented.
**Risk Score:** 3/10 — low complexity, purely additive CI job.
**Dependencies:** None.
**Competitive Reference:** Standard for content sites with external/affiliate links; `lychee`-based link-checking is common in static-site CI pipelines.
**Security/Privacy Impact:** Indirectly protects against link-hijacking risk if an outbound domain expires and is later re-registered maliciously (a known content-site risk pattern), by surfacing dead outbound links promptly.
**Rollout Readiness:** High.
**Validation Gates:** (1) CI job runs against the live deployed URL with `--recurse`; (2) a deliberately broken link (e.g., temporary 404 target) causes the job to fail or clearly flag; (3) the job's scope includes `index.html`, all `articles/*.html`, and `store.html`, not just `docs/`.
**Acceptance Criteria:** (1) A new CI job runs `linkinator` (or equivalent) against the deployed site, recursing through all indexable pages; (2) store product CTAs and social/outbound links are included in scope; (3) the job blocks merge on newly-introduced broken links (distinct from the existing advisory-only doc-link check); (4) `docs/TEST_STRATEGY.md` is updated to mark this as implemented.

### FR-005

**Description:** Add a `.pre-commit-config.yaml` running `markdownlint-cli2` and the existing frontmatter-validation Python script locally, before commit, so the drift class already fixed once (per `findings.json` F-0001) cannot silently reoccur.
**Why It Matters:** The repo's own prior self-audit (`findings.json`, F-0005) already identified and left this open: "No local pre-commit hook for markdownlint / frontmatter checks — drift can re-occur... Frontmatter and markdown drift only surfaces at PR time, after work is already done." This review independently confirms no `.pre-commit-config.yaml` exists.
**Verification Evidence:** Glob for `.pre-commit-config.yaml` at repo root returned no matches; `findings.json` F-0005 (status: "open") documents the same gap with recommendation text (EV-09).
**Evidence IDs:** EV-09
**Priority:** P2
**Category:** Developer Velocity / CI Hygiene
**ROI Score:** 4/10 — small effort, meaningfully reduces PR-rejection friction for future doc contributions; velocity-weighted rather than user-facing.
**Risk Score:** 2/10 — trivial complexity, purely additive tooling.
**Dependencies:** Reuses the exact validation logic already embedded in `.github/workflows/doc-lint.yml`.
**Competitive Reference:** Standard practice; the repo's own `AGENTS.md`/agent tooling already assumes a mature dev workflow, making this a natural completion.
**Security/Privacy Impact:** None.
**Rollout Readiness:** High — the validation logic to wrap already exists verbatim in `doc-lint.yml`.
**Validation Gates:** (1) Committing a markdown file with invalid frontmatter is blocked locally before it reaches CI; (2) `pre-commit run --all-files` passes on the current repo state; (3) the hook's logic matches `doc-lint.yml`'s validator exactly (no drift between local and CI checks).
**Acceptance Criteria:** (1) `.pre-commit-config.yaml` exists and includes markdownlint-cli2 and a frontmatter-validation hook; (2) `CONTRIBUTING.md` documents how to install/run it; (3) `findings.json` F-0005 is updated from "open" to "fixed" with a commit reference.

### FR-006

**Description:** Add a `LICENSE` file at the repo root declaring the terms under which this public-facing content/code repository may be reused, forked, or referenced.
**Why It Matters:** The repository is publicly hosted (GitHub Pages site, public GitHub repo implied by `og:url`) but carries no license file, leaving reuse terms for both the article content and the (minimal) site code legally ambiguous for any third party.
**Verification Evidence:** Glob for `LICENSE*` at repo root returned no matches (EV-07).
**Evidence IDs:** EV-07
**Priority:** P2
**Category:** Governance / Legal Hygiene
**ROI Score:** 3/10 — low direct business impact, but a near-zero-cost fix that removes ambiguity for a public repo.
**Risk Score:** 2/10 — trivial to add, minimal downside.
**Dependencies:** None.
**Competitive Reference:** Standard GitHub repo hygiene; the footer already states "All rights reserved," which a formal LICENSE file would make explicit and legally clearer.
**Security/Privacy Impact:** None.
**Rollout Readiness:** High.
**Validation Gates:** (1) `LICENSE` file exists and is a recognized license identifier (or explicit all-rights-reserved notice) recognized by GitHub's license detector; (2) GitHub repo UI correctly displays the detected license badge.
**Acceptance Criteria:** (1) `LICENSE` file added at repo root; (2) content matches the footer's stated "All rights reserved" intent or an explicitly chosen open license; (3) `README.md` references the license.

### FR-007

**Description:** Add a `CODEOWNERS` file designating review ownership for `docs/10-governance/`, `.github/workflows/`, and the store/unsubscribe pages given their compliance sensitivity.
**Why It Matters:** No `CODEOWNERS` file exists; for a repo that already has a governance-doc folder and a swarm-gate CI check enforcing agent-registration schemas, formalizing human review ownership for compliance-sensitive pages (store payment links, unsubscribe flow) would have caught the broken-endpoint issue (FR-002) at PR time via required review.
**Verification Evidence:** Glob for `CODEOWNERS` at repo root and `.github/` returned no matches (EV-08).
**Evidence IDs:** EV-08
**Priority:** P2
**Category:** Governance / Process
**ROI Score:** 3/10 — low cost, moderate process-trust benefit.
**Risk Score:** 2/10 — trivial complexity.
**Dependencies:** None.
**Competitive Reference:** Standard GitHub practice already partially modeled by this repo's `swarm-gate.yml` (which checks for `AGENT.md`/`AGENTS.md` but not `CODEOWNERS`).
**Security/Privacy Impact:** Indirectly reduces the chance of unreviewed changes to compliance-sensitive pages (unsubscribe, store checkout links) shipping unnoticed.
**Rollout Readiness:** High.
**Validation Gates:** (1) A PR touching `unsubscribe.html` or `store.html` requires the designated owner's approval; (2) GitHub's CODEOWNERS syntax validator shows no errors.
**Acceptance Criteria:** (1) `.github/CODEOWNERS` exists; (2) it covers at minimum `unsubscribe.html`, `store.html`, and `docs/10-governance/`; (3) branch protection enforces code-owner review on `main`.

### FR-008

**Description:** Add a minimal end-to-end store/checkout smoke test (e.g., a Playwright script that visits `store.html`, clicks each product CTA, and asserts it lands on a valid Stripe checkout page) run in CI, per `docs/TEST_STRATEGY.md` §4's explicit "before any store-related change" requirement.
**Why It Matters:** All 6 store product links currently point to `buy.stripe.com/test_...` URLs; there is no automated check confirming these links resolve correctly or that the checkout flow the site depends on for revenue actually functions, despite the test strategy document specifically calling for pre-change verification of this flow.
**Verification Evidence:** `docs/TEST_STRATEGY.md` lines 52–57 specify the exact requirement and test-card guidance; Grep of `store.html` confirms all 6 CTAs use `test_` Stripe URLs (EV-10); no CI workflow exercises this flow.
**Evidence IDs:** EV-10, EV-01
**Priority:** P1
**Category:** Revenue-Critical Reliability
**ROI Score:** 6/10 — this is the site's direct monetization path (digital product sales); a silently broken checkout link means lost revenue with no alerting, which is a foundation-level gap for a store page.
**Risk Score:** 5/10 — moderate complexity (needs a headless-browser test), but currently zero automated protection for a revenue-generating flow.
**Dependencies:** Could share Playwright tooling with FR-visual-regression work already specified in `docs/TEST_STRATEGY.md` §9 (also unimplemented, noted but not raised as a separate FR here to avoid low-value padding given it's a lower-priority nice-to-have relative to functional checkout verification).
**Competitive Reference:** Standard for any e-commerce-adjacent static site; Stripe's own documentation recommends automated checkout-link verification for exactly this "buy button" pattern.
**Security/Privacy Impact:** Confirms no secret keys are exposed in page source (already a stated goal in `docs/TEST_STRATEGY.md` §4) as part of the same automated check.
**Rollout Readiness:** Medium — requires Playwright setup, though the target commands are already sketched in `docs/TEST_STRATEGY.md`.
**Validation Gates:** (1) CI test visits `store.html` and confirms all 6 CTAs return valid (non-404) Stripe checkout pages; (2) a deliberately broken link fails the test; (3) test confirms no live/production secret keys appear in rendered page source.
**Acceptance Criteria:** (1) An automated test (Playwright or equivalent) runs against `store.html` verifying each product CTA resolves to a valid checkout page; (2) the test runs on every change to `store.html` (as `docs/TEST_STRATEGY.md` specifies); (3) test failures block merge; (4) `docs/TEST_STRATEGY.md` §4 is updated to reflect the now-automated process.

## Prioritized Implementation Roadmap

1. **P0 — Foundation (do first):** FR-001 (Lighthouse CI gate), FR-002 (fix broken unsubscribe endpoint). These close the two most consequential gaps: an entirely undelivered "primary quality gate" the repo's own strategy doc promises, and a functionally broken, compliance-relevant feature currently shipping to production.
2. **P1 — Quality Completion:** FR-003 (accessibility audit), FR-004 (site-wide link checking), FR-008 (store checkout smoke test). These complete the test-strategy coverage the repo already committed to in writing but never automated.
3. **P2 — Hygiene:** FR-005 (pre-commit hooks), FR-006 (LICENSE), FR-007 (CODEOWNERS). Low-cost, low-risk repo hygiene items appropriate once the functional/quality gates above are in place.

## Top 5 Highest-ROI Features

| Rank | FR | ROI | Risk | Rationale |
|---|---|---|---|---|
| 1 | FR-001 (Lighthouse CI gate) | 8 | 3 | Directly protects organic-traffic-dependent business model; near-zero implementation cost since the exact command is already documented. |
| 2 | FR-002 (Fix unsubscribe endpoint) | 6 | 7 | Fixes an actively broken, compliance-relevant feature currently shipping to real visitors. |
| 3 | FR-008 (Store checkout smoke test) | 6 | 5 | Protects the site's direct monetization path from silent breakage. |
| 4 | FR-003 (Accessibility audit) | 6 | 4 | Broadens addressable readership and closes a documented-but-unimplemented test category cheaply. |
| 5 | FR-004 (Site-wide link checking) | 5 | 3 | Protects reader trust and SEO signal quality; command already specified in existing docs. |

## Validation Plan

- Each FR's CI-based validation gate should be demonstrated by (a) a passing run against the current site state and (b) a deliberately-broken test case showing the gate correctly fails, mirroring the rigor already modeled by `doc-lint.yml`'s frontmatter validator.
- FR-002 additionally requires a manual, out-of-band confirmation that the corrected unsubscribe endpoint actually processes a test request end-to-end, since this is a functional/compliance fix, not just a CI addition.
- After implementation, `docs/TEST_STRATEGY.md` should be updated line-by-line to move each newly-automated check from "specified" to "implemented," closing the doc-vs-code gap this review identified as the repo's central pattern.
- `findings.json` should be updated to mark F-0005 as resolved once FR-005 ships, maintaining the repo's existing self-audit trail.

## Executive Summary

Aresmax-blog is a well-constructed static content/store site with strong SEO fundamentals and documented (if not fully enforced) security posture. The verified gaps are not about missing ambition — `docs/TEST_STRATEGY.md` already specifies a thorough test regime (Lighthouse, axe, linkinator, Playwright, Stripe flow testing) — but about that ambition never being wired into the 3 actual CI workflows, all three of which govern documentation and AI-agent metadata rather than the shipped website. The most urgent finding is a live functional defect: the unsubscribe form points at an unreachable private-network address, meaning a legally-relevant feature is silently broken for every real visitor. The 8 FRs here close that defect and complete the test-strategy-to-CI gap, plus round out standard repo hygiene (LICENSE, CODEOWNERS, pre-commit hooks) that the repo's own prior self-audit had already begun tracking.
