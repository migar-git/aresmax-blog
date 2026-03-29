# Technical Debt — aresmax-blog

**Audit Date:** 2026-03-29

## What's Missing vs. What Should Exist

| Should Exist | Current State | Priority |
|-------------|---------------|----------|
| `sitemap.xml` | Absent | High |
| `robots.txt` | Absent | High |
| Affiliate link tracking | Not visible | High |
| Analytics integration | Absent | High |
| GitHub Actions deploy workflow | Manual push only | High |
| Article template | Absent | Medium |
| Consistent internal linking | Unknown | Medium |
| `images/` directory | Absent | Medium |
| CSS custom properties | Unknown | Low |
| `404.html` for GitHub Pages | Absent | Low |
| Performance optimization (font loading) | Partially done | Low |

## Gap Between Current State and Production-Ready State

**Current state:** Functional static blog with SEO basics. Missing monetization infrastructure and content automation.

**Production-ready affiliate blog requires:**
- Affiliate links with UTM tracking on all relevant articles.
- Analytics to measure traffic and conversion.
- 20+ articles covering target keywords.
- Automated content pipeline from arescore → blog.
- Sitemap.xml for search engine discovery.
- Internal linking strategy.
- Regular content updates (2+ articles/week to build SEO velocity).

**Estimated gap:** 60% of production readiness. The site skeleton is good; it needs content volume and monetization infrastructure.
