---
canonical_title: Pages
description: Create and maintain page instances in SkyCMS, including template-backed general articles and one-off content paths.
doc_type: How-to
product_area: site-building
user_intent: create-and-manage-pages
audience:
  - Designers
  - Front-End Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Pages

## Summary

Pages are concrete content instances built from articles, optionally backed by templates, and rendered in layouts.

## When to use this page

Use this guide when you need to:

- create new page instances from templates,
- create one-off articles directly inside a layout without using a template,
- validate page composition and publish readiness,
- diagnose page-level issues after template or layout changes.

## Terminology note

In site-builder language, a **page** usually means a general article and its expected public result. The canonical data model is:

```text
Layout -> Template (optional) -> Article -> Published Page
```

Use **article** when discussing authoring and lifecycle behavior. Use **published page** when discussing public output.

## Create a page

Pages are concrete content instances built from articles, optionally backed by templates, and rendered in layouts.

Standard creation flow:

1. Start from the page creation entry point.
2. Set title and URL/path.
3. Choose an appropriate template.
4. Create the page and open it in the Visual Editor.
5. Add and format content in the template's editable regions.

Use templates by default; start from blank only when a page is truly one-off.

## When to skip a template

Creating an article without a page template is appropriate when:

- the page is a genuine one-off,
- the structure will not be reused across a content series,
- the layout already provides enough framing,
- speed matters more than building a reusable pattern first.

This path should be the exception, not the default. If you notice the same article structure being recreated more than once, move that pattern into a template.

## Select template and layout

Selection strategy:

- Layout controls the site-wide shell.
- Template controls the page-level content structure.
- If no template is used, the article itself carries the page-level structure.

When selecting:

- choose the layout family that matches section/site context,
- choose the template pattern that matches the content intent,
- avoid using highly specialized templates as general defaults.

For new sections:

1. Validate layout fit first.
2. Create or adjust template.
3. Create page instances from that template.

For one-off pages:

1. Validate layout fit first.
2. Start from a blank or no-template article path.
3. Build only the content structure needed for that single page.

Related docs:

- [Layouts](./layouts.md)
- [Templates](./templates.md)

## Example implementations

These examples show how a stand-alone article can be authored directly inside a layout without relying on a reusable page template.

- [Article Examples Overview](./article-examples/overview.md)
- [Standalone Content Article Examples](./article-examples/standalone-content.md)
- [Announcement and Update Article Examples](./article-examples/announcement-update.md)
- [Resource Article with Table of Contents Examples](./article-examples/resource-with-toc.md)
- [Event Page Article Examples](./article-examples/event-page.md)

Use these patterns when a page is intentionally one-off and does not justify its own reusable template.

## Structure content sections

For reliable authoring and long-term maintenance:

- keep heading hierarchy consistent,
- separate summary/intro from long body content,
- use media blocks with clear captions/alt text,
- avoid placing mission-critical text in decorative components.

Recommended page structure baseline:

1. Title region
2. Intro/summary region
3. Main body region
4. Supporting media or CTA region

When handing pages to editors, include notes about:

- intended voice/length,
- required fields/regions,
- constraints for hero/media components.

## Publish and verify

Publishing paths:

- Publish now for immediate go-live.
- Schedule for coordinated releases.

Verification checklist after publish:

- page resolves on expected URL,
- navigation links point correctly,
- layout and template render as intended,
- page displays correctly on mobile and desktop,
- key media/assets load successfully.

For release-quality pages, also validate:

- accessibility basics (heading order, contrast, alt text),
- metadata and social preview essentials,
- performance impact of media-heavy sections.

## Ongoing page operations

- Update page content in the Visual Editor.
- Rebase page structure when template updates are promoted.
- Unpublish/delete/trash through editorial lifecycle workflows when retiring content.

See editor workflows:

- [For Editors Overview](../for-editors/overview.md)
- [Updating and Deleting Articles](../for-editors/updating-and-deleting-articles.md)
- [Scheduling Pages](../for-editors/page-scheduling.md)

## Troubleshooting

Common issues and checks:

- page looks wrong after template change: verify template update path and region ID continuity,
- publish appears stale: clear cache and confirm correct version/state,
- missing media: verify file path/storage availability,
- unexpected layout: confirm assigned/default layout resolution.

## Related guides

- [Layouts](./layouts.md)
- [Templates](./templates.md)
- [Article Examples Overview](./article-examples/overview.md)
- [For Editors Overview](../for-editors/overview.md)
