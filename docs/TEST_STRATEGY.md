# Test Strategy — aresmax-blog

## Overview

Aresmax Blog is a static HTML/CSS/JS content site and digital product store. Testing covers content quality, store functionality, performance, accessibility, and link integrity.

## Test Categories

### 1. Lighthouse Audits (Primary Quality Gate)

**Targets:**

| Category | Minimum Score |
|---|---|
| Performance | ≥ 90 |
| Accessibility | ≥ 90 |
| Best Practices | ≥ 90 |
| SEO | ≥ 95 |

```bash
npx lighthouse https://migar-git.github.io/aresmax-blog --output html --output-path ./lighthouse-report.html
```

Run on both desktop and mobile presets.

### 2. Accessibility Testing

- Run axe DevTools on homepage, store.html, and article pages
- All images require descriptive `alt` text
- Article body text must meet 4.5:1 color contrast
- Keyboard navigation through all article links, product CTAs, and store buttons

### 3. Link Checking

```bash
npx linkinator https://migar-git.github.io/aresmax-blog --recurse
```

Verify:
- All article links in the blog listing resolve
- Store product CTAs open correct Stripe/payment pages
- Unsubscribe page links function correctly
- Social and outbound links are live

### 4. Store / Payment Flow Testing

Before any store-related change:
- Test product purchase CTA with Stripe test card `4242 4242 4242 4242`
- Verify success redirect after payment
- Confirm no secret keys exposed in page source

### 5. Email Compliance Testing

- Unsubscribe page must function (test opt-out flow)
- Unsubscribe link must be present in all email templates
- Privacy policy accurately describes email data collection

### 6. Cross-Browser Testing

Chrome, Firefox, Safari, Edge — latest versions.

### 7. Mobile/Responsive Testing

| Breakpoint | Device |
|---|---|
| 375px | Small phones |
| 768px | Tablet |
| 1280px | Desktop |

Priority: article readability and store CTA buttons on mobile.

### 8. SEO Checks

- `<title>` unique and keyword-rich per article
- `<meta name="description">` present on all pages
- Open Graph tags for social sharing of articles
- sitemap.xml lists all articles and store pages
- robots.txt not blocking content

### 9. Visual Regression (Major Redesigns)

```bash
npx playwright screenshot https://migar-git.github.io/aresmax-blog --full-page --output before.png
```

## Test Schedule

| Trigger | Tests |
|---|---|
| Before every push | Browser smoke test |
| New article added | Link check, SEO meta, mobile layout |
| Store change | Payment flow test, Stripe test mode |
| Monthly | Full Lighthouse, link check |
