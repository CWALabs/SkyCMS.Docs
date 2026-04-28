---
canonical_title: Foundation Layout Example
description: Build a SkyCMS layout shell using Foundation grid and structural primitives for traditional multi-page websites.
doc_type: Tutorial
product_area: site-building
user_intent: implement-a-foundation-based-layout-shell
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

# Foundation Layout Example

## Summary

This example shows a SkyCMS layout implemented with Foundation. It is a good fit for teams that want a mature responsive grid system, a structured component approach, and strong support for traditional multi-page site layouts.

## Outcome

After working through this example, you should have a Foundation-based layout shell that supports consistent page structure and responsive behavior.

## Good fit when

- you want a robust responsive layout framework,
- your team prefers a more structured class system,
- you are building a marketing or information-heavy site with predictable layout regions.

## Example structure

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ page.title }}</title>
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/foundation-sites@6.8.1/dist/css/foundation.min.css">
  <style>
    :root {
      --brand-primary: #1779ba;
      --brand-dark: #24303f;
    }

    .site-header,
    .site-footer {
      background: var(--brand-dark);
      color: white;
    }

    .site-main {
      padding: 3rem 0;
      background: #f7f9fb;
    }
  </style>
</head>
<body>
  <header class="site-header">
    <div class="grid-container">
      <div class="grid-x align-middle padding-top-1 padding-bottom-1">
        <div class="cell small-12 medium-4">
          <a href="/" class="h4 text-white" style="color:white; margin:0;">SkyCMS Site</a>
        </div>
        <div class="cell small-12 medium-8 text-right">
          <nav>
            <a class="margin-right-1" style="color:white;" href="/about">About</a>
            <a class="margin-right-1" style="color:white;" href="/services">Services</a>
            <a class="margin-right-1" style="color:white;" href="/blog">Blog</a>
            <a class="button primary small margin-bottom-0" href="/contact">Contact</a>
          </nav>
        </div>
      </div>
    </div>
  </header>

  <main class="site-main">
    <div class="grid-container">
      <!-- Template/page content renders here -->
      {{ page.content }}
    </div>
  </main>

  <footer class="site-footer padding-top-2 padding-bottom-2">
    <div class="grid-container">
      <div class="grid-x align-middle">
        <div class="cell small-12 medium-8">
          <p class="margin-bottom-0">SkyCMS Site. Foundation-based layout shell.</p>
        </div>
        <div class="cell small-12 medium-4 text-right">
          <a style="color:white;" href="/privacy">Privacy</a>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
```

## Why this works well in SkyCMS

- Foundation’s grid and layout primitives map well to shared site shells.
- It supports traditional multi-page design patterns without pushing an SPA mental model.
- It is well suited to teams that want a framework with strong responsive structure and conservative defaults.

## Implementation notes

- Keep the layout focused on structure, navigation, and site-wide styling.
- Use Foundation’s grid for predictable content regions, but keep template-specific compositions out of the layout shell.
- Test mobile navigation behavior carefully if you introduce custom JavaScript interactions.

## Best use cases

- documentation portals,
- enterprise marketing sites,
- public-sector or higher-education sites,
- teams that want a structured alternative to Bootstrap.

## Related examples

- [Bootstrap 5 Layout Example](./bootstrap-5.md)
- [Tailwind CSS Layout Example](./tailwind.md)
- [Bulma Layout Example](./bulma.md)

## Verification

This example is successful when Foundation grid structure renders correctly across breakpoints, shared header/footer regions remain stable, and page content loads inside the layout container without style conflicts.
