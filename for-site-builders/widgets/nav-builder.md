---
canonical_title: Nav Builder Widget
description: Render child-page navigation lists from the SkyCMS table-of-contents API with the nav builder helper.
doc_type: How-to
product_area: site-building
user_intent: build-navigation-list-from-toc-data
audience:
  - Site Builders
  - Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Nav Builder Widget

## Summary

Builds a simple list of links (child pages) under a given root path using the SkyCMS Table of Contents API.

- Location (source): `Editor/wwwroot/lib/cosmos/nav-builder.js`
- Primary API: `ccms___NavBuilder(pagePath, navElementId, liClassName?, anchorClassName?)`

## Outcome

After completing this guide, you should be able to render a navigation list for any valid root path and style it with optional list and anchor classes.

## Steps

1. Add a `<ul>` or `<ol>` container element with the target `id` to your page markup.
2. Include `nav-builder.js` in your layout or page template: `<script src="/lib/cosmos/nav-builder.js"></script>`.
3. Call `ccms___NavBuilder(pagePath, navElementId)` after the DOM is ready, using the desired root path without a leading slash.
4. Optionally pass `liClassName` and `anchorClassName` to apply CSS classes to generated list items and links.
5. Load the page and verify the navigation list renders with the correct child-page links.

## How it works

- Fetches `/Home/GetTOC?page=/{pagePath}` (GET) and expects JSON with an `Items` array.
- For each item, takes the last segment of `item.Title` for link text and uses `"/" + item.UrlPath` for the `href`.
- Appends `<li><a></a></li>` to the container with `id=navElementId`.

## Minimal HTML example

```html
<ul id="ulNav" class="nav flex-column"></ul>

<script src="/lib/cosmos/nav-builder.js"></script>
<script>
  // Build navigation for children under "/docs"
  // li gets Bootstrap class "nav-item" and anchor gets "nav-link"
  ccms___NavBuilder('docs', 'ulNav', 'nav-item', 'nav-link');
</script>
```

## Notes

- Ensure the element with `navElementId` exists before invoking.
- `pagePath` should not include a leading slash.
- You can omit `liClassName` and/or `anchorClassName` to avoid adding classes.

## Verification

This integration is complete when the helper renders expected child-page links and each generated URL resolves to the intended page.

## Related guides

- [Widgets Overview](./overview.md)
- [Table of Contents Widget](./table-of-contents.md)
