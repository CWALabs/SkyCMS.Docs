---
canonical_title: Table of Contents Widget
description: Build navigation lists and breadcrumbs from the SkyCMS table-of-contents API using client-side widget helpers.
doc_type: How-to
product_area: site-building
user_intent: render-navigation-and-breadcrumbs-from-toc-data
audience:
  - Site Builders
  - Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Table of Contents Widget

## Summary

Helpers to render navigation lists from the SkyCMS Table of Contents API and to build breadcrumbs automatically.

- Location (source): `Editor/wwwroot/lib/cosmos/toc.js`
- Public functions:
  - `cosmos_cms_build_toc_default(navElementId, anchorClassName?, activeCssClass?)`
  - `cosmos_cms_build_toc(pagePath, navElementId, liClassName?, anchorClassName?, activeCssClass?)`
  - `cosmos_cms_build_breadcrumbs(breadCrumbId)`

## Outcome

After completing this guide, you should be able to render a page-aware ToC and breadcrumb trail using the widget API.

## Steps

1. Add the page path meta tag to the document `<head>`: `<meta name="cwps-meta-path-url" content="section/page" />`.
2. Add a container element for the ToC list to your markup (e.g., `<ul id="ulToc"></ul>`).
3. Include `toc.js` in your layout or page template: `<script src="/lib/cosmos/toc.js"></script>`.
4. Call `cosmos_cms_build_toc_default('ulToc')` for automatic path detection, or `cosmos_cms_build_toc(pagePath, ...)` to specify a root path manually.
5. Load the page and verify navigation items and active link highlighting render correctly.

## API endpoints

- GET `/Home/GetTOC?page=/{pagePath}`
  - Optional query parameters: `pageNo`, `pageSize`, `orderByPub`
  - Returns JSON with `Items` array: `{ UrlPath, Title, Published, Updated, BannerImage, AuthorInfo }`

## cosmos_cms_build_toc_default

Reads the current page path from the head meta tag and renders children pages under it.

- Requires `<meta name="cwps-meta-path-url" content="docs/getting-started" />` in `<head>`
- If content is `root`, uses an empty path (top-level)

Example:

```html
<ul id="ulToc"></ul>
<meta name="cwps-meta-path-url" content="docs/getting-started" />
<script src="/lib/cosmos/toc.js"></script>
<script>
  cosmos_cms_build_toc_default('ulToc', 'nav-link', 'active');
</script>
```

## cosmos_cms_build_toc

Manually specify a root path and target container. The function attaches a `DOMContentLoaded` listener and uses XHR to fetch the ToC.

- `pagePath`: path without a leading slash (e.g., `docs/getting-started`)
- `navElementId`: id of `<ul>` or `<ol>` container
- `liClassName`: optional class name for each `<li>`
- `anchorClassName`: optional class name for each `<a>`
- `activeCssClass`: optional; if set, anchors that match the current `window.location.pathname` get this class

Example:

```html
<ul id="ulToc" class="list-unstyled"></ul>
<script src="/lib/cosmos/toc.js"></script>
<script>
  cosmos_cms_build_toc('docs', 'ulToc', 'nav-item', 'nav-link', 'active');
</script>
```

## cosmos_cms_build_breadcrumbs

Builds breadcrumb `<li><a></a></li>` items from the page path meta tag and document title (segments separated by `/`).

Example:

```html
<meta name="cwps-meta-path-url" content="docs/getting-started/installation" />
<title>Docs/Getting Started/Installation</title>
<ol id="olCrumbs"></ol>
<script src="/lib/cosmos/toc.js"></script>
<script>
  cosmos_cms_build_breadcrumbs('olCrumbs');
</script>
```

## Notes

- Link text uses the last segment of `item.Title`.
- Link href uses `"/" + item.UrlPath`.
- When `activeCssClass` is provided, the script will compare `href` to the current path (case-insensitive) and add the class when it matches.

## Verification

This integration is complete when the widget renders expected links from `/Home/GetTOC`, applies the active class on the current page, and breadcrumbs match the page path metadata.

## Related guides

- [Widgets Overview](./overview.md)
- [Nav Builder Widget](./nav-builder.md)
- [Breadcrumbs Widget](./breadcrumbs.md)
