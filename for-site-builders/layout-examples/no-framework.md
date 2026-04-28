---
canonical_title: No-Framework Layout Example
description: Build a lightweight SkyCMS layout shell with plain HTML and custom CSS variables, without a third-party CSS framework.
doc_type: Tutorial
product_area: site-building
user_intent: implement-a-layout-without-css-framework-dependencies
audience:
  - Site Builders
  - Designers
  - Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# No-Framework Layout Example

## Summary

This example shows a SkyCMS layout built with plain HTML and custom CSS, without relying on a third-party CSS framework. It is a good fit for teams that want a lightweight baseline, already have an internal design system, or prefer to define every styling decision themselves.

## Outcome

After working through this example, you should have a framework-free layout shell that supports shared navigation, content rendering, and footer structure.

## Good fit when

- you want minimal dependencies,
- you already have established design tokens,
- you want full control over naming, spacing, and responsive behavior,
- you want a neutral starting point before choosing a framework.

## Example structure

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ page.title }}</title>
  <style>
    :root {
      --color-bg: #f6f7fb;
      --color-surface: #ffffff;
      --color-text: #1f2937;
      --color-muted: #6b7280;
      --color-border: #d1d5db;
      --color-accent: #2563eb;
      --color-accent-dark: #1d4ed8;
      --color-header: #111827;
      --radius-md: 0.75rem;
      --space-2: 0.5rem;
      --space-4: 1rem;
      --space-6: 1.5rem;
      --space-8: 2rem;
      --max-width: 72rem;
    }

    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: "Segoe UI", system-ui, sans-serif;
      color: var(--color-text);
      background: var(--color-bg);
      line-height: 1.6;
    }

    a {
      color: var(--color-accent);
      text-decoration: none;
    }

    a:hover {
      color: var(--color-accent-dark);
    }

    .site-shell {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    .container {
      width: min(100% - 2rem, var(--max-width));
      margin-inline: auto;
    }

    .site-header {
      background: var(--color-header);
      color: white;
      border-bottom: 1px solid rgba(255, 255, 255, 0.12);
    }

    .site-header__inner,
    .site-footer__inner {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: var(--space-4);
      padding: var(--space-6) 0;
    }

    .site-nav {
      display: flex;
      gap: var(--space-6);
      flex-wrap: wrap;
    }

    .site-nav a {
      color: white;
      font-weight: 600;
    }

    .site-main {
      flex: 1;
      padding: var(--space-8) 0;
    }

    .content-panel {
      background: var(--color-surface);
      border: 1px solid var(--color-border);
      border-radius: var(--radius-md);
      padding: var(--space-8);
      box-shadow: 0 12px 32px rgba(17, 24, 39, 0.06);
    }

    .site-footer {
      border-top: 1px solid var(--color-border);
      background: var(--color-surface);
    }

    .site-footer p {
      margin: 0;
      color: var(--color-muted);
    }

    @media (max-width: 768px) {
      .site-header__inner,
      .site-footer__inner {
        flex-direction: column;
        align-items: flex-start;
      }

      .content-panel {
        padding: var(--space-6);
      }
    }
  </style>
</head>
<body>
  <div class="site-shell">
    <header class="site-header">
      <div class="container site-header__inner">
        <a href="/" style="color:white; font-size:1.125rem; font-weight:700;">SkyCMS Site</a>
        <nav class="site-nav" aria-label="Primary">
          <a href="/about">About</a>
          <a href="/services">Services</a>
          <a href="/blog">Blog</a>
          <a href="/contact">Contact</a>
        </nav>
      </div>
    </header>

    <main class="site-main">
      <div class="container">
        <div class="content-panel">
          <!-- Template/page content renders here -->
          {{ page.content }}
        </div>
      </div>
    </main>

    <footer class="site-footer">
      <div class="container site-footer__inner">
        <p>SkyCMS Site. Custom no-framework layout shell.</p>
        <a href="/privacy">Privacy</a>
      </div>
    </footer>
  </div>
</body>
</html>
```

## Why this works well in SkyCMS

- It keeps the layout small, understandable, and easy to customize.
- It makes layout responsibilities explicit without inheriting framework conventions you may not want.
- It provides a clean baseline for teams that may later introduce a design system or component library.

## Implementation notes

- Define tokens early so templates and pages inherit a consistent visual language.
- Keep layout CSS focused on structure and shared rules, not page-specific styling.
- Document shared classes such as `.container`, `.site-nav`, and `.content-panel` so future contributors reuse them consistently.

## Best use cases

- custom-branded marketing sites,
- lightweight editorial sites,
- internal sites with an existing design language,
- teams that want to avoid third-party CSS dependencies.

## Related examples

- [Bootstrap 5 Layout Example](./bootstrap-5.md)
- [Tailwind CSS Layout Example](./tailwind.md)
- [Bulma Layout Example](./bulma.md)
- [Foundation Layout Example](./foundation.md)

## Verification

This example is successful when shared layout regions render consistently across pages, responsive behavior works on mobile and desktop, and page content inserts correctly into `{{ page.content }}`.
