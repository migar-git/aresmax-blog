# Security — aresmax-blog

## Content Security Policy

CSP is set via `<meta http-equiv="Content-Security-Policy">` in each HTML file.

Current allowlist:
- `script-src 'self' 'unsafe-inline'` — inline scripts permitted; tighten to nonce if possible
- `style-src 'self' 'unsafe-inline' https://fonts.googleapis.com`
- `font-src 'self' https://fonts.gstatic.com`
- `img-src 'self' data: https:` — external images allowed (affiliate banners)
- `object-src 'none'` — blocks Flash/plugin exploits

## Affiliate Link Safety

- All affiliate links must go through HTTPS endpoints only.
- Use `rel="noopener noreferrer"` on all `target="_blank"` links.
- Disclose affiliate relationships per FTC guidelines (see `affiliate-disclosure` or inline copy).

## Email List Compliance

- `unsubscribe.html` must remain accessible and functional.
- Do not store email addresses in this repository.

## Secrets

This is a static site. No server-side secrets. Do not embed:
- Email service API keys in HTML/JS
- Webhook URLs in publicly visible code

## Reporting Issues

Report security concerns privately to the repo owner. Do not open public issues.
