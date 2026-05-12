---
title: "Deployment — aresmax-blog"
owner: "migar"
status: "Active"
last_reviewed: "2026-05-12"
---

# Deployment — aresmax-blog

## Platform

Hosted on **GitHub Pages** (`main` branch → root). Custom domain via CNAME (if configured).

## Deploy Process

```bash
git add .
git commit -m "content: add article — your-slug"
git push origin main
```

GitHub Pages rebuilds within ~30 seconds. No CI required.

## Post-Deploy Checks

- Verify new article URLs resolve (200 OK)
- Check sitemap.xml is accessible at `/sitemap.xml`
- Confirm affiliate/outbound links open correctly

## Rollback

```bash
git revert HEAD
git push origin main
```

## Checklist Before Publishing

- [ ] Article HTML validates
- [ ] Meta title and description present
- [ ] Canonical URL set correctly
- [ ] sitemap.xml updated
- [ ] Affiliate disclosure present where required
- [ ] unsubscribe link in any email CTAs
