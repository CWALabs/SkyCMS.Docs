---
canonical_title: Article Examples
description: Use one-off article examples for unique pages that do not need reusable templates, while preserving safe editing patterns.
doc_type: Explanation
product_area: site-building
user_intent: choose-direct-article-implementation-vs-template
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

# Article Examples

## Summary

This section provides examples for articles that do not use a page template.

In this rendering path, the active layout still provides the outer shell, but the article itself defines the page-level structure. These examples are useful for one-off pages where creating a reusable template would add more overhead than value.

## Outcome

After completing this guide, you should be able to decide whether a page should stay as a direct article or be promoted into a reusable template.

## When this approach makes sense

Use stand-alone article structures when:

- the page is unique,
- the structure is unlikely to be reused,
- you need to move quickly,
- the layout already provides enough framing and navigation.

If a pattern repeats, it should usually be promoted into a page template instead.

## Included article types

- [Standalone Content Article](./standalone-content.md): a flexible one-off content page with title, summary, body, and optional supporting callout.
- [Announcement and Update Article](./announcement-update.md): a concise update page for releases, notices, or operational changes.
- [Resource Article with Table of Contents](./resource-with-toc.md): a long-form information page with in-page navigation.
- [Event Page Article](./event-page.md): a one-off event or registration page with timing, location, and supporting media.

## Direct article vs reusable template

| Choose | Best when | Avoid when |
| --- | --- | --- |
| Direct article in a layout | The page is unique, fast delivery matters, and the structure is unlikely to be reused. | You already know this format will be repeated across a section or campaign. |
| Reusable template | Multiple pages need the same structure, editors need consistency, and long-term maintenance matters. | The page is truly one-off and the template would only be used once. |

## Frameworks used in these examples

Each article type includes examples for:

- No Framework
- Bootstrap 5
- Tailwind CSS
- Bulma
- Foundation

## Design rules for no-template articles

Stand-alone articles should still follow the same editing rules as templates:

- use non-nested editable regions,
- keep region names descriptive,
- apply `class="ck-content"` to rich content areas,
- use `data-editor-config="title"` for heading-only regions,
- use `data-editor-config="image-widget"` when the article needs image upload support.

The difference is that these regions are scoped to a single article rather than a reusable template contract.

## Widget-backed variants in this section

Some examples in this section also show direct article pages using built-in widgets rather than only plain editable markup:

- [Standalone Content Article](./standalone-content.md) includes an image-widget variant.
- [Resource Article with Table of Contents](./resource-with-toc.md) includes a ToC-widget variant using `cosmos_cms_build_toc_default`.

## Related guides

- [Pages](../pages.md)
- [Templates](../templates.md)
- [Creating Editable Areas](../../for-developers/website-launch/CreatingEditableAreas.md)
- [Image Widget](../widgets/image.md)
- [Table of Contents Widget](../widgets/table-of-contents.md)
- [Layouts, Templates, and Articles](../../for-developers/layouts-templates-articles.md)

## Verification

This page is successful when you can select an appropriate article example for a unique page and justify whether template promotion is necessary for reuse.
