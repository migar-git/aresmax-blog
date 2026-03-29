# Agent Readiness — aresmax-blog

**Audit Date:** 2026-03-29

## Current Agent Readiness: Low (22 / 100)

Static site with no automation hooks. An agent can read the HTML but cannot publish content, update the site, or measure performance without additional infrastructure.

## What's Working

- AGENT.md schema v1.0 present.
- GitHub Pages deployment means an agent can publish by simply pushing to `main`.
- Content format (HTML articles) is simple enough for agent generation.

## What Needs to Be Built for Agent Automation

| Component | Priority | Description |
|-----------|----------|-------------|
| Article template (`articles/_template.html`) | High | Agents need a template to generate new articles without reinventing structure |
| `generate_sitemap.py` | High | Agent regenerates sitemap.xml after publishing new articles |
| GitHub Actions workflow | High | Auto-deploys on push; agent just commits, CI handles the rest |
| `publish_article.py` | Medium | Agent script: takes arescore draft → renders HTML → commits → pushes |
| Analytics API integration | Medium | Agent reads Plausible/GA data to report performance back to arescore KPIs |
| Affiliate link auditor | Medium | Agent verifies all articles have affiliate links and UTM tracking |
| Internal link generator | Low | Agent identifies and inserts internal links between articles |

## For Static Site Agents — Recommended Automation

1. **Content pipeline**: arescore/content/review/ → `publish_article.py` → aresmax-blog/articles/ → git push → auto-deploy.
2. **Weekly SEO audit**: agent checks sitemap.xml completeness, verifies all articles have affiliate disclosure, reports gaps to arescore KPIs.
3. **Monthly content gap analysis**: agent compares arescore/research/keywords/ against published articles and identifies missing coverage.
4. The simplest first step is `publish_article.py` — a 50-line Python script that converts a Markdown draft to HTML using the article template. Copilot can write 90% of this.
