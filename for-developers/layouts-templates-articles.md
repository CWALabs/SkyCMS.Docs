---
canonical_title: Layouts, Templates, and Articles
description: Canonical developer guide to how layouts, templates, articles, and published pages relate in SkyCMS.
doc_type: Explanation
product_area: development
user_intent: understand-layouts-templates-and-articles
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Layouts, Templates, and Articles

## Summary

Canonical developer guide to how layouts, templates, articles, and published pages relate in SkyCMS.

## When to use this page

Use this guide when you need to:

- understand how layout/template/article layers compose at runtime,
- decide when templates are optional or recommended,
- align implementation and authoring boundaries across roles.

## Related guides

- Layout implementation guide: [./layouts.md](./layouts.md)
- Template implementation guide: [./templates.md](./templates.md)
- Site-builder layout guide: [../for-site-builders/layouts.md](../for-site-builders/layouts.md)
- Article lifecycle: [./article-lifecycle.md](./article-lifecycle.md)

## Canonical terminology

Use these terms consistently in developer-facing documentation:

- **Layout**: the site-wide shell.
- **Template**: an optional reusable structure inside a layout.
- **Article**: the authored source record.
- **Published Page**: the public projection created from an article when it is published.

In editor and site-builder docs, the word **page** often refers to a general article. In developer docs, prefer the more precise terms **article** and **published page**.

## Hierarchy At A Glance

The rendering hierarchy in SkyCMS is:

- Layout wraps everything.
- Template (if used) sits inside the layout.
- Article content sits inside the template.
- Publishing creates the public `PublishedPage` projection.

When no template is used:

- Layout wraps the article directly.

## Conceptual Model

### Layout

A layout is the outer shell shared across pages.

Typical responsibilities:

- Global structure (`header`, `main`, `footer`)
- Site-wide navigation and utility regions
- Shared head/footer markup and body attributes

### Template

A template is an optional reusable content pattern used inside the layout.

Templates are useful when a series of articles share the same format, for example:

- News posts with a consistent hero + metadata + body layout
- Product updates with repeated sections
- Case studies with standard intro, highlights, and outcomes blocks

If many articles need the same content structure, templates reduce duplication and improve consistency.

### Article

An article is the authored content instance (page/post data and content) that ultimately renders for users.

After publishing, the article produces a `PublishedPage` record used for public delivery.

## How They Work Together

### Path A: Article with Template

1. Resolve active layout (layout family/version).
2. Select template inside that layout context.
3. Bind article content into the template regions.
4. Render final output inside the layout shell.

In short:

- Layout -> Template -> Article -> Published Page

### Path B: Article without Template

1. Resolve active layout.
2. Render article content directly in layout content region.

In short:

- Layout -> Article -> Published Page

## When Templates Are Optional vs Recommended

Templates are optional for article rendering, but recommended when:

- Multiple articles share the same section structure.
- Editors need a consistent authoring pattern.
- You want predictable presentation across a content series.

Templates are often unnecessary when:

- A page is truly one-off.
- Structure varies significantly across pages.
- Layout-level framing plus article content is sufficient.

## Data Relationship Notes

From a developer perspective:

- Layout families are tracked through `LayoutNumber`.
- Template-to-layout association can be family-based (`LayoutNumber`) or version-pinned (`LayoutId`).
- Articles are independent content records and may render with or without a template path depending on flow and configuration.

## Developer Implementation Guidance

When designing features:

- Keep layout concerns at the shell level.
- Use templates to model repeated article structures, not one-off content.
- Avoid forcing templates for all article scenarios.
- Ensure rendering behavior is correct for both template and no-template paths.

## Cross-Team Guidance

Use [../for-site-builders/layouts.md](../for-site-builders/layouts.md) when deciding what belongs in layouts versus template structure.

Use [./layouts.md](./layouts.md) for versioning, import, preview, and runtime layout-resolution details.
