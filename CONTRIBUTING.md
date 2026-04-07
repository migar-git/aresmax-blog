# Contributing to aresmax-blog

## Local Development

No build step required. Open `index.html` in a browser or serve locally:

```bash
npx serve .
# or
python -m http.server 8080
```

## Adding a New Article

1. Create `articles/your-article-slug.html` (copy an existing article as template).
2. Update `index.html` to add the article card in the listing.
3. Add the URL to `sitemap.xml`.
4. Update `blog.html` if it aggregates article listings.

## Content Guidelines

- Write for practitioners: concrete steps, real tools, honest caveats.
- Include a meta description (150-160 chars) and relevant keywords.
- Add the article's canonical URL via `<link rel="canonical">`.
- Images: self-hosted in `/articles/` subfolder, optimized to < 200 KB.

## Deploying

Push to `main`. GitHub Pages auto-deploys. See `docs/DEPLOYMENT.md`.

## Do Not Commit

- Analytics pixel tokens or tracking IDs in plain HTML
- Affiliate link tracking params without disclosure
- Any credentials or API keys
