---
canonical_title: Bulma Layout Example
description: Implement a SkyCMS layout shell with Bulma’s class-based responsive structure and minimal JavaScript assumptions.
doc_type: Tutorial
product_area: site-building
user_intent: implement-a-bulma-based-layout-shell
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

# Bulma Layout Example

## Summary

This example shows a SkyCMS layout implemented with Bulma. It is a good fit for teams that want a clean class-based CSS framework with minimal JavaScript assumptions and readable HTML structure.

## Outcome

After working through this example, you should have a Bulma-based layout shell with reusable header, content, and footer structure.

## Steps

1. Create a new layout file in your SkyCMS site or theme folder.
2. Copy the example HTML below as a starting point.
3. Replace `{{ page.content }}` with your SkyCMS content region binding if not already present.
4. Update the navigation links to match your site structure.
5. Save the file and assign the layout to your target pages or sections in SkyCMS.
6. Preview a page using the new layout and confirm styling and navigation render correctly.

## Good fit when

- you want a lightweight CSS-only framework,
- you prefer expressive class names over dense utility markup,
- you want a straightforward responsive layout system without SPA conventions.

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
    href="https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css">
  <style>
    :root {
      --site-accent: #3273dc;
      --site-dark: #1f2937;
    }

    .site-header {
      border-bottom: 1px solid #e5e7eb;
    }

    .site-footer {
      background: var(--site-dark);
      color: white;
    }
  </style>
</head>
<body>
  <header class="site-header">
    <div class="container px-4 py-5">
      <div class="level mb-0">
        <div class="level-left">
          <a href="/" class="title is-5 mb-0 has-text-dark">SkyCMS Site</a>
        </div>
        <div class="level-right is-hidden-mobile">
          <a class="mr-5 has-text-dark" href="/about">About</a>
          <a class="mr-5 has-text-dark" href="/services">Services</a>
          <a class="mr-5 has-text-dark" href="/blog">Blog</a>
          <a class="button is-link" href="/contact">Contact</a>
        </div>
      </div>
    </div>
  </header>

  <main class="section">
    <div class="container">
      <!-- Template/page content renders here -->
      {{ page.content }}
    </div>
  </main>

  <footer class="site-footer footer py-6">
    <div class="container is-flex is-justify-content-space-between is-align-items-center is-flex-wrap-wrap gap-4">
      <div>
        <strong class="has-text-white">SkyCMS Site</strong><br>
        <span class="is-size-7">Bulma-based layout shell.</span>
      </div>
      <a class="has-text-white" href="/privacy">Privacy</a>
    </div>
  </footer>
</body>
</html>
```

## Why this works well in SkyCMS

- Bulma keeps layout markup readable and close to plain HTML semantics.
- It supports responsive layouts well without requiring framework JavaScript for the core shell.
- It works well for teams that want conventional class-based patterns without utility-first density.

## Implementation notes

- Keep navigation and structural regions in the layout, not in templates.
- Add only the JavaScript you actually need for specific interactions.
- Use custom styles sparingly to avoid fighting the framework’s defaults.

## Best use cases

- brochure and company websites,
- editorial or blog-focused sites,
- teams that want a simpler framework than Bootstrap,
- projects where readable HTML is a priority.

## Related examples

- [Bootstrap 5 Layout Example](./bootstrap-5.md)
- [Tailwind CSS Layout Example](./tailwind.md)
- [Foundation Layout Example](./foundation.md)

## Verification

This example is successful when Bulma layout classes render expected spacing and alignment, navigation remains usable across screen sizes, and page content inserts cleanly in the main region.
