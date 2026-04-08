# ADR-001: Initial Architecture — Static HTML/CSS/JS on GitHub Pages

**Date:** 2026-01-01
**Status:** Accepted
**Author:** migar

---

## Context

Aresmax Blog is a content-first publishing platform and digital product store. It publishes practical guides on AI tools, trading bots, automation, and passive income — paired with a store selling related digital products. The site must be fast, SEO-friendly, and inexpensive to operate.

Architecture options evaluated:

1. **Static HTML/CSS/JS on GitHub Pages** — zero cost, maximum SEO control, no maintenance
2. **Ghost (self-hosted)** — purpose-built blogging with built-in subscription/membership, but requires server ($5–20/month VPS) and ongoing maintenance
3. **Ghost Pro** — managed Ghost, but $9+/month and limits custom design
4. **Next.js + MDX on Vercel** — developer-friendly content with React, but adds build complexity
5. **WordPress on shared hosting** — large ecosystem, but security patching burden

## Decision

**Static HTML/CSS/JS on GitHub Pages, with Stripe/payment links for the store.**

All article content is authored directly as HTML files. The store (`store.html`) uses Stripe Payment Links — no server-side processing required.

## Rationale

### Why static HTML (not Ghost or WordPress)?

- **SEO:** Static pages have deterministic HTML output — no rendering dependencies, no database queries. Every article is a fast, crawlable HTML page. Google's crawl budget is fully utilized.
- **Cost:** GitHub Pages is free. Ghost Pro costs $9+/month; a VPS for self-hosted Ghost costs $5–20/month. The current revenue model (affiliate + product sales) cannot justify platform costs before break-even.
- **Security:** No CMS means no admin login to brute-force, no plugin vulnerabilities, no SQL injection surface.
- **Control:** Raw HTML gives complete control over structured data markup (Article schema), meta tags, and custom layouts per article.

### Why GitHub Pages path-based hosting (not custom domain)?

- Aresmax Blog is one property in the ClawMedia portfolio. Using `migar-git.github.io/aresmax-blog` avoids the cost of a separate domain at the blog's early stage.
- A custom domain can be added later with a CNAME file — zero migration needed.

### Why Stripe Payment Links (not Gumroad/Payhip)?

- Stripe Payment Links require no backend — the purchase flow is a redirect to Stripe-hosted checkout
- Lower transaction fees than Gumroad (5% + fees) at comparable revenue
- Stripe brand recognition builds buyer trust

## Consequences

### Positive
- Excellent Core Web Vitals (no JS framework overhead)
- Strong SEO by default (static HTML, full meta control)
- Deployment is a single `git push`
- No subscription cost

### Negative / Trade-offs
- No native comment system (would require Disqus or similar)
- No built-in email newsletter — requires a separate ESP (ConvertKit, MailerLite)
- Articles must be authored as HTML, not Markdown or a rich-text editor
- No built-in analytics — requires GA4 or similar

## Future Considerations

If the blog reaches sufficient scale to justify a CMS, the migration path is:
1. **Short-term:** Add a headless CMS (Contentlayer + MDX) with Next.js on Vercel — articles become Markdown files compiled to static HTML
2. **Long-term:** Full Ghost Pro migration with membership/subscription features if the email list exceeds 10,000 subscribers

Current static HTML articles are fully portable — no CMS-specific markup to remove.
