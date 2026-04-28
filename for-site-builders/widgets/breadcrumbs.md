---
canonical_title: Breadcrumbs Widget
description: Build breadcrumb navigation from page path metadata and title segments using the SkyCMS breadcrumbs widget helper.
doc_type: How-to
product_area: site-building
user_intent: render-breadcrumb-navigation-with-widget-helper
audience:
  - Site Builders
  - Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Breadcrumbs Widget

## Summary

Builds breadcrumb navigation from the current page title and a meta tag that encodes the path segments.

- Location (source): `Editor/wwwroot/lib/cosmos/crumbs.js`
- Auto-run: On `DOMContentLoaded` the script reads the configured target and builds `<li><a></a></li>` items under it.

## Outcome

After completing this guide, you should be able to render a working breadcrumb trail that matches page-path metadata.

## How it works

The script expects these inputs:

- A global variable defined before the script loads:
  - `const breadCrumbId = "olCrumbs";` — the id of the container element (an `<ol>` or `<ul>`).
- A meta tag in the document head that contains the URL path split by `/`:
  - `<meta name="cwps-meta-path-url" content="samples/accordion" />`
- The document title also contains the matching breadcrumb titles, split by `/`:
  - e.g., `Samples/Accordion` so the script can map segment titles to links.

The script then iterates the segments, building anchor hrefs based on the meta path and link text from `document.title`.

## Minimal HTML example

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="cwps-meta-path-url" content="docs/getting-started/installation" />
    <title>Docs/Getting Started/Installation</title>
  </head>
  <body>
    <nav aria-label="breadcrumb">
      <ol id="olCrumbs"></ol>
    </nav>

    <script>
      // Must be defined before crumbs.js is loaded
      const breadCrumbId = 'olCrumbs';
    </script>
    <script src="/lib/cosmos/crumbs.js"></script>
  </body>
</html>
```

## Notes

- Ensure the number of segments in `document.title` matches the segments in the `cwps-meta-path-url` meta content.
- The script assumes forward-slash `/` separated segments and constructs hrefs cumulatively from the meta path.

## Verification

This integration is complete when breadcrumb items render in order, link URLs resolve correctly, and titles match the intended path segments.

## Related guides

- [Widgets Overview](./overview.md)
- [Table of Contents Widget](./table-of-contents.md)
- [Nav Builder Widget](./nav-builder.md)
