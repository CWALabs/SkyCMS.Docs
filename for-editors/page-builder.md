---
canonical_title: Page Builder
description: Use the SkyCMS visual drag-and-drop builder to compose layouts, templates, and article structures with GrapesJS.
doc_type: How-to
product_area: editing
user_intent: compose-page-structure-visually
audience:
  - Content Editors
  - Site Builders
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Page Builder

## Summary

Use this guide when you need to compose layouts, templates, or article structures visually with the SkyCMS Page Builder.

## Outcome

After completing this guide, you should be able to use Page Builder confidently, understand its main interface areas, and follow a safe structure-first workflow before handing work off for review or publishing.

## Overview

Page Builder is SkyCMS's visual drag-and-drop design experience, powered by GrapesJS. It is used to create and maintain layouts and templates without writing code for every change.

## When to use this page

Use this guide when you need to:

- compose or adjust layout/template structure visually,
- iterate quickly on responsive page composition,
- hand off visual structures to editors and developers.

## Where to use Page Builder

- Layouts: build shared page chrome (header/footer/navigation).
- Templates: build reusable body structures for new pages.
- Articles: create structured content visually when appropriate.

## Core interface areas

- Blocks panel: drag ready-made components onto canvas.
- Canvas: WYSIWYG editing area with in-context preview.
- Style manager: visual CSS controls (spacing, typography, dimensions, color, borders).
- Layers panel: hierarchical structure for selecting and reordering nested elements.
- Asset manager: upload/select images and media.

## Layers panel

The **Layers panel** shows the current element hierarchy for the page-builder canvas.

- Use it to select nested elements that are hard to click directly.
- Use it to verify structure after drag-and-drop edits.
- Use it to reorder elements without editing raw markup.

Terminology note:

- The **Layers panel** is an editor feature.
- It is not the same as the SkyCMS content model of layouts, templates, articles, and published pages.

See [Layers Panel](./layers.md) for the dedicated guide.

## Key capabilities

- Drag-and-drop composition with reusable components.
- Responsive preview for desktop/tablet/mobile.
- Built-in support for common frameworks when detected (for example Bootstrap/Tailwind blocks).
- Import/export HTML/CSS for migration workflows.
- Integration with image editing and file management.

## Typical workflow

1. Start with a simple section/container structure.
2. Add content blocks (text, image, button, forms, media).
3. Apply styles from the style manager.
4. Verify layer structure and clean nesting.
5. Validate responsive behavior across breakpoints.
6. Save, preview, then publish.

## Best practices

- Keep structures shallow and readable.
- Prefer reusable classes over heavy inline styling.
- Test mobile behavior early, not at the end.
- Use semantic headings and meaningful link text.
- Pair visual edits with targeted code editor fixes when needed.

## Related guides

- [Page Builder Quick Start](./page-builder-quickstart.md)
- [Layers Panel](./layers.md)
- [Visual Editor](./visual-editor.md)
- [Code Editor](./code-editor.md)
- [For Site Builders: Layouts](../for-site-builders/layouts.md)
