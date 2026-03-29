# Copilot Optimization — aresmax-blog

**Audit Date:** 2026-03-29

## Current Copilot Usefulness Rating: 3 / 10

Static HTML/CSS has limited Copilot value. Copilot can assist with HTML boilerplate and CSS, but there is no logic, no build system, and no JavaScript framework to benefit from Copilot's strengths.

## Opportunities for AI Assistance

| Task | Opportunity |
|------|-------------|
| New article creation | Agent clones article template, fills in content from arescore drafts/ |
| SEO meta tag generation | Agent generates consistent meta tags for each article |
| Affiliate link insertion | Agent finds affiliate opportunities and inserts tracked links |
| Sitemap.xml maintenance | Agent regenerates sitemap.xml whenever a new article is added |
| Internal linking | Agent identifies link opportunities between articles |
| Content auditing | Agent checks articles for affiliate link coverage and SEO completeness |

## What Needs to Be Built for Copilot to Help More

1. **Article template** (`articles/_template.html`) — Copilot can help populate new articles from the template.
2. **GitHub Actions publish workflow** — trigger on push to `main`; Copilot can write the YAML.
3. **`generate_sitemap.py`** — simple Python script; Copilot can write and maintain it.
4. **`affiliate_audit.py`** — script that scans articles for affiliate links and reports coverage; Copilot-generatable.
5. **JavaScript for analytics** — once an analytics provider is chosen, Copilot can insert the tracking snippet consistently.
