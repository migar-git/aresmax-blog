---
title: "Runbook — aresmax-blog"
owner: "migar"
status: "Active"
last_reviewed: "2026-05-12"
---

# Runbook — aresmax-blog

## Service Overview

- **Site:** https://migar-git.github.io/aresmax-blog
- **Type:** Static HTML/CSS/JS blog and digital product store
- **Hosting:** GitHub Pages (branch: main, path-based at /aresmax-blog)
- **Store:** store.html with Stripe/payment links

---

## Routine Operations

### Deploy a Change

```bash
git add <files>
git commit -m "type: description"
git push origin main
```

GitHub Pages publishes within ~60 seconds.

### Verify the Site is Live

```bash
curl -I https://migar-git.github.io/aresmax-blog
# Expect: HTTP/2 200
```

---

## Incident Procedures

### Site Not Loading

1. Check https://www.githubstatus.com
2. If GitHub Pages operational: check Settings → Pages, confirm source is `main` / root
3. Note: this site is at a path (`/aresmax-blog`) not a custom domain — verify the Pages URL in repository settings

### Store Page Not Loading

1. Confirm `store.html` exists at the repository root
2. Check browser console for JS errors on store.html
3. Verify the product links/payment buttons point to correct URLs

### Payment Button Not Working

1. Check browser console for errors
2. Verify Stripe payment link in the button href is correct
3. Test with Stripe test card: `4242 4242 4242 4242`
4. Check Stripe dashboard for failed events

### Unsubscribe Page Not Working

1. Test the unsubscribe form at `unsubscribe.html`
2. Verify the API endpoint in the form submission JS is correct and live
3. Check the email service provider's unsubscribe handling

### Rollback a Bad Deployment

```bash
git revert HEAD
git push origin main
# Or for a specific commit:
git revert <bad-commit-sha>
git push origin main
```

---

## Cache Invalidation

Allow 60–120 seconds after push. Test with incognito window or hard-refresh (Ctrl+Shift+R).

---

## Content Operations

### Publish a New Article

1. Create article HTML file in `articles/` or repo root
2. Add article card to `index.html` listing
3. Add real affiliate/product links using `rel="noopener noreferrer"`
4. Update `sitemap.xml`
5. Push to main

### Update Store Product

1. Edit `store.html` with updated product details/pricing
2. Verify Stripe payment link is correct for the new price
3. Push to main and test purchase flow

### Add Affiliate Links to Article

1. Replace placeholder links with real affiliate URLs
2. Add `rel="noopener noreferrer sponsored"` to all affiliate links
3. Verify affiliate disclosure is visible on the page

---

## Monitoring

- Recommended: UptimeRobot monitor on the GitHub Pages URL
- Check Stripe dashboard monthly for store conversion data
- Review Google Search Console for crawl errors

---

## Contacts

| Role | Contact |
|---|---|
| Site Owner | migar (GitHub) |
| Payment Processor | Stripe dashboard — dashboard.stripe.com |
| Email Service | Check configured email provider for unsubscribe API |
