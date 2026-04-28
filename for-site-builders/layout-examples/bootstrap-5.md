---
canonical_title: Bootstrap 5 Layout Example
description: Implement a SkyCMS layout shell using Bootstrap 5 grid, utilities, and navigation patterns.
doc_type: Tutorial
product_area: site-building
user_intent: implement-a-bootstrap-based-layout-shell
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

# Bootstrap 5 Layout Example

## Summary

This example shows a SkyCMS layout implemented with Bootstrap 5. It is a good fit for teams that want a familiar responsive grid, reusable utility classes, and a broad set of common UI patterns.

## Outcome

After working through this example, you should have a responsive Bootstrap-based layout shell with shared navigation and footer regions.

## Steps

1. Create a new layout file in your SkyCMS site or theme folder.
2. Copy the example HTML below as a starting point.
3. Replace `{{ page.content }}` with your SkyCMS content region binding if not already present.
4. Update the navigation links to match your site structure.
5. Save the file and assign the layout to your target pages or sections in SkyCMS.
6. Preview a page using the new layout and confirm styling and navigation render correctly.

## Good fit when

- your team already knows Bootstrap,
- you want a predictable grid and spacing system,
- you expect to use common patterns such as navbars, cards, alerts, and responsive containers.

## Example structure

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ page.title }}</title>
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
  <style>
    :root {
      --brand-primary: #0d6efd;
      --brand-dark: #14213d;
      --brand-surface: #f8f9fa;
    }

    body {
      background: var(--brand-surface);
    }

    .site-header {
      background: var(--brand-dark);
    }

    .site-footer {
      background: var(--brand-dark);
    }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">
  <header class="site-header text-white border-bottom border-secondary-subtle">
    <nav class="navbar navbar-expand-lg navbar-dark container py-3">
      <a class="navbar-brand fw-semibold" href="/">SkyCMS Site</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div id="mainNav" class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto gap-lg-3">
          <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
          <li class="nav-item"><a class="nav-link" href="/services">Services</a></li>
          <li class="nav-item"><a class="nav-link" href="/blog">Blog</a></li>
          <li class="nav-item"><a class="btn btn-primary ms-lg-2" href="/contact">Contact</a></li>
        </ul>
      </div>
    </nav>
  </header>

  <main class="flex-grow-1 py-5">
    <div class="container">
      <!-- Template/page content renders here -->
      {{ page.content }}
    </div>
  </main>

  <footer class="site-footer text-white mt-auto py-4">
    <div class="container d-flex flex-column flex-md-row justify-content-between gap-3">
      <div>
        <strong>SkyCMS Site</strong><br>
        <small>Published with a Bootstrap 5 layout shell.</small>
      </div>
      <div class="text-md-end">
        <a class="link-light text-decoration-none" href="/privacy">Privacy</a>
      </div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

## Why this works well in SkyCMS

- Bootstrap handles layout, spacing, and navigation without forcing SPA architecture.
- The `container` and `container-fluid` patterns map naturally to layout and template boundaries.
- Shared styles can stay in the layout while page-specific sections remain in templates.

## Implementation notes

- Keep Bootstrap includes in the layout head so all templates inherit them consistently.
- Prefer custom CSS variables for brand colors instead of editing framework source.
- Use Bootstrap components selectively; do not let the layout become a dumping ground for page-specific UI.

## Best use cases

- marketing sites,
- documentation or knowledge-base sites,
- business websites with blog and landing pages,
- teams migrating from an older Bootstrap-based site.

## Related examples

- [Tailwind CSS Layout Example](./tailwind.md)
- [Bulma Layout Example](./bulma.md)
- [Foundation Layout Example](./foundation.md)

## Verification

This example is successful when Bootstrap styles load globally, navigation and layout regions are responsive, and templates render cleanly within the shared container.
