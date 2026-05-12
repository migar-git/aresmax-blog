---
title: "Aresmax Blog — Product Requirements Document"
version: "1.0"
status: "Active"
owner: "migar"
last-updated: "2026-04-07"
last_reviewed: "2026-05-12"
---

# Aresmax Blog — PRD

> **Version 1.0** | Active | Updated 2026-04-07

## 1. Vision & Problem Statement

Aresmax Blog (hosted at migar-git.github.io/aresmax-blog) is a content-first platform publishing practical guides on AI tools, trading bots, automation, and passive income strategies for entrepreneurs. It pairs editorial content with a digital product store (store.html) selling prompt engineering guides, automation templates, trading bot setups, and a "Digital CEO Toolkit" bundle. The blog serves as top-of-funnel content that drives traffic, builds trust, and converts readers into buyers — supporting the wider Aresmax brand ecosystem.

**Problem:** Entrepreneurs seeking actionable, no-hype guidance on monetizing AI face a landscape dominated by surface-level content and paid-ad funnels. A trusted, technical editorial voice filling that gap can build a loyal audience that converts to product purchases.

**Audience:** Digital entrepreneurs (25–45) exploring AI-powered income; side-hustle builders learning trading bots and automation; makers and developers who want practical, technical depth without marketing fluff.

## 2. Goals & Success Metrics

| Goal | KPI | Target | Measurement Method |
|---|---|---|---|
| Grow readership | Monthly unique sessions | +20% MoM | GA4 |
| Drive product sales | Store page conversions | 15+/month | Stripe dashboard |
| Build subscriber list | Email subscribers | 100+/month | Email platform |
| Establish topical authority | Articles ranking in top 10 | 5+ | Google Search Console |
| Deepen engagement | Avg. article read time | > 4 min | GA4 engagement |

## 3. User Personas

| Persona | Role | Pain Points | What Success Looks Like |
|---|---|---|---|
| The Maker | Developer / indie hacker | Wants to add AI income streams; skeptical of hype | Reads a bot/automation article; buys a template from store |
| The Starter | Early-career entrepreneur | Overwhelmed; doesn't know where to begin | Subscribes after reading "How to Make Money with AI in 2026" |
| The Trader | Retail trader curious about automation | Wants proven bot setups, not theory | Buys the trading bot setup product from store |
| The Builder | Already running a small business | Looking to automate operations with AI | Buys the Digital CEO Toolkit bundle |

## 4. Functional Requirements

### 4.1 Content

- FR-001: Homepage MUST display an articles grid with card layout: tag, title, excerpt, read-more link, and date/read-time meta.
- FR-002: Each article page MUST contain full content with proper heading hierarchy, internal links, and a CTA to the store or subscription.
- FR-003: Site MUST maintain a consistent publishing cadence — minimum 1 new article per 2 weeks.
- FR-004: Article topics MUST map to store products (e.g., trading bot articles link to trading bot setup product).
- FR-005: Store page MUST present all SKUs with tag, title, feature list, price, and Stripe buy link.
- FR-006: Unsubscribe page MUST be functional for email list management compliance.

### 4.2 Conversion & Monetization

- FR-007: Store page MUST be accessible from site header navigation.
- FR-008: Each store product MUST have a direct Stripe checkout link.
- FR-009: Email subscription CTA MUST appear on homepage (below-fold section) and within article footers.
- FR-010: Articles MUST include contextual CTAs linking to relevant store products.
- FR-011: A "30-day money-back guarantee" message MUST appear on the store page.
- FR-012: GitHub profile link MUST be present to build developer credibility.

### 4.3 SEO

- FR-013: All article pages MUST have unique meta title, description, canonical URL, and OG/Twitter card tags.
- FR-014: Structured data (Article schema) MUST be present on article pages.
- FR-015: Site MUST maintain a valid robots.txt and sitemap (if generated).

## 5. Non-Functional Requirements

| Category | Requirement | Target | Priority |
|---|---|---|---|
| Performance | LCP | < 2s (minimal CSS, no heavy frameworks) | P0 |
| Performance | Page weight | < 500 KB per page | P0 |
| SEO | Core Web Vitals | All green | P0 |
| SEO | OG + Twitter meta | Present on all pages | P1 |
| Accessibility | WCAG AA | Pass | P1 |
| Security | HTTPS (GitHub Pages default) | 100% | P0 |
| Compatibility | Mobile responsive | All breakpoints | P0 |

## 6. Constraints

- Hosted on GitHub Pages — static files only, no server-side logic.
- No CMS — article HTML must be authored manually or via static generator.
- Stripe handles all payment processing externally.
- No database — subscriber capture requires third-party (Mailchimp, ConvertKit, etc.).
- Canonical URL uses github.io subdomain (no custom domain for this repo).

## 7. Out of Scope

- Comments section.
- Dynamic search / filtering.
- User accounts.
- Video content hosting.
- Podcast or audio content.

## 8. Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Publishing cadence drops off | High | High | Maintain editorial calendar; batch-draft articles |
| Store Stripe links go stale / test mode | Medium | High | Audit all store links before and after each deploy |
| Low discoverability (github.io subdomain) | High | Medium | Add custom domain; submit sitemap to GSC |
| Content undifferentiated from competitors | Medium | Medium | Lead with original data, real revenue numbers, and technical depth |
| Email capture not wired up | Medium | Medium | Integrate a form service (ConvertKit free tier) before launch |

## 9. Document Index

| Document | Path | Status |
|---|---|---|
| Architecture | /docs/ARCHITECTURE.md | Active |
| PRD (this file) | /docs/PRD.md | Active |
| Store | /store.html | Active |
| Unsubscribe | /unsubscribe.html | Active |
| Articles | /articles/ | Active |
