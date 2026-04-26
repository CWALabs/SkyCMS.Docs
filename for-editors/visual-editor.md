---
canonical_title: Using the Visual Editor
description: Edit article content directly in page context with the SkyCMS Visual Editor, including formatting, preview, save, and publish workflows.
audience:
  - Content Editors
doc_type: How-to
status: Draft
entities:
  - visual-editor
  - article
  - editable-region
keywords:
  - visual editor
  - wysiwyg
  - ckeditor
  - edit page content
source: SkyCMS/Docs/Editors/LiveEditor/
---

# Using the Visual Editor

## Terminology note

The Visual Editor is used to edit article content inside the page context supplied by the active layout and template.

The Visual Editor is SkyCMS's inline WYSIWYG editor for editing content directly in page context. It is built on CKEditor 5 and supports rich text formatting, links, media, tables, quick save, and collaboration.

## When to use this page

Use this guide when you need to:

- edit page content directly in context,
- understand core editing, preview, and publish actions,
- locate deeper visual or technical editor references.

## Open and Navigate the Editor

1. Open **Editor** and find the page you want to update.
2. Select **Edit**.
3. Click inside any editable region (regions usually show on hover).
4. Use the floating selection toolbar for inline text actions and the block toolbar for block-level insert and layout actions.

## Edit Page Content

Common editing operations:

- Text formatting: headings, bold, italic, underline, lists, quotes, code blocks.
- Links:

  - Standard external links.
  - Internal page links via page link tooling.
- Media:

  - Insert images from file manager or by URL.
  - Embed videos (for example YouTube or Vimeo).
- Tables: insert, resize, and style tables.

Advanced editing operations:

- Open the code editor for precise HTML edits.
- Insert downloadable file links.
- Work in structured regions without leaving page context.

## Preview Changes

- Preview frequently while editing to verify spacing, typography, and link behavior.
- Validate responsive behavior for desktop and mobile breakpoints.
- Confirm that inserted media and downloadable links render correctly.

## Save and Publish

- Auto-save runs after short idle periods.
- Manual save: `Ctrl+S` (Windows/Linux) or `Cmd+S` (macOS).
- Publish workflow:

  - Publish now for immediate go-live.
  - Publish later with the scheduling workflow.

## AI assistance in the Visual Editor

The Visual Editor includes region-scoped AI writing assistance.

Use it when you want to:

- improve a paragraph,
- rewrite a selected block,
- tighten or simplify copy,
- generate more polished HTML for the active editor region.

The Visual Editor AI works differently from the code editor AI:

- it is scoped to the active CKEditor region,
- it focuses on writing and markup in that region,
- it can include a model picker when the configured provider supports per-user model selection.

For full guidance, see [AI Assistant](./ai-assistant.md).

## Related guides

- [Visual Editor Quick Start](./visual-editor-quickstart.md)
- [Visual Editor Visual Guide](./visual-editor-visual-guide.md)
- [Visual Editor Technical Reference](./visual-editor-technical-reference.md)
- [Visual Editor Toolbar Reference](./visual-editor-toolbar-reference.md)
- [AI Assistant](./ai-assistant.md)
- [Scheduling Pages](./page-scheduling.md)
