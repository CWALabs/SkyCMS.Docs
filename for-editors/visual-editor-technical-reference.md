---
canonical_title: Visual Editor Technical Reference
description: Technical implementation details for SkyCMS Visual Editor architecture, toolbar modes, save flow, and extension points.
doc_type: Reference
product_area: editing
user_intent: understand-visual-editor-technical-design-and-integration-points
audience:
  - Developers
  - Administrators
difficulty: advanced
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Visual Editor Technical Reference

## Summary

Use this reference when you need implementation-level details for Visual Editor runtime behavior, mode-specific tooling, save flow, and server integration.

This page captures technical details of the Visual Editor implementation for developers and administrators.

## Architecture Summary

- Frontend editor stack: CKEditor 5 inline/balloon model.
- Optional code editing: Monaco integration.
- Real-time collaboration: SignalR events and presence.
- Backend: ASP.NET Core MVC controller and view pipeline.

## Visual Editor Modes

SkyCMS Visual Editor supports four runtime toolbar profiles:

- `title`: compact title/heading-focused editing.
- `simple`: lightweight formatting set for straightforward content edits.
- `standard`: default authoring profile for most editable regions.
- `advanced`: full-feature profile for power editing scenarios.

Mode selection can be explicit (for example via `data-editor-config`) or inferred by runtime behavior when no explicit profile is provided.

### Simulated Toolbars by Mode

The following simulated strips show the configured tools for each mode.

Title mode:

Main toolbar: no standard action buttons. A title mode indicator can appear.

Selection balloon tools:

![Bold](../assets/images/ckeditor/toolbar-icons/bold.svg)
![Italic](../assets/images/ckeditor/toolbar-icons/italic.svg)

Simple mode:

![Paragraph](../assets/images/ckeditor/toolbar-icons/paragraph.svg)
![Bold](../assets/images/ckeditor/toolbar-icons/bold.svg)
![Italic](../assets/images/ckeditor/toolbar-icons/italic.svg)
![Underline](../assets/images/ckeditor/toolbar-icons/underline.svg)
![Bulleted list](../assets/images/ckeditor/toolbar-icons/bulleted-list.svg)
![Numbered list](../assets/images/ckeditor/toolbar-icons/numbered-list.svg)
![Link](../assets/images/ckeditor/toolbar-icons/link.svg)
![Quote](../assets/images/ckeditor/toolbar-icons/quote.svg)

Standard mode:

![Heading](../assets/images/ckeditor/toolbar-icons/heading2.svg)
![Undo](../assets/images/ckeditor/toolbar-icons/undo.svg)
![Redo](../assets/images/ckeditor/toolbar-icons/redo.svg)
![Bold](../assets/images/ckeditor/toolbar-icons/bold.svg)
![Italic](../assets/images/ckeditor/toolbar-icons/italic.svg)
![Underline](../assets/images/ckeditor/toolbar-icons/underline.svg)
![Link](../assets/images/ckeditor/toolbar-icons/link.svg)
![File link](../assets/images/ckeditor/toolbar-icons/paper-clip.svg)
![Image upload](../assets/images/ckeditor/toolbar-icons/image-upload.svg)
![Media](../assets/images/ckeditor/toolbar-icons/media.svg)
![Quote](../assets/images/ckeditor/toolbar-icons/quote.svg)
![Todo list](../assets/images/ckeditor/toolbar-icons/todo-list.svg)

Advanced mode:

![Heading](../assets/images/ckeditor/toolbar-icons/heading2.svg)
![Link](../assets/images/ckeditor/toolbar-icons/link.svg)
![Image upload](../assets/images/ckeditor/toolbar-icons/image-upload.svg)
![Image style](../assets/images/ckeditor/toolbar-icons/image.svg)
![Toggle image caption](../assets/images/ckeditor/toolbar-icons/caption.svg)
![Table](../assets/images/ckeditor/toolbar-icons/table.svg)
![Media](../assets/images/ckeditor/toolbar-icons/media.svg)
![Code block](../assets/images/ckeditor/toolbar-icons/code-block.svg)
![Indent](../assets/images/ckeditor/toolbar-icons/indent.svg)
![Outdent](../assets/images/ckeditor/toolbar-icons/outdent.svg)

For a tool-by-tool breakdown with mode availability, see [Visual Editor Toolbar Reference](./visual-editor-toolbar-reference.md).

## Toolbar Interaction Model

Recent UX updates consolidate insertion flows into unified dropdowns:

- Link insertion uses a single `Insert link` dropdown with:
  - `From website page`
  - `From another website`
- Image insertion uses a single image dropdown with:
  - `From computer`
  - `From website storage`
  - `From another website`

This keeps toolbars cleaner while preserving all insertion paths.

## Important Server Components

- Controller: `EditorController` actions for edit, region save, and body save.
- Views: editor host view and content iframe rendering.
- Hub: live collaboration hub for editor events and synchronization.

## Data and Save Flow

1. Load page and initialize editable regions.
2. User edits a region.
3. Auto-save or manual save posts updated content.
4. Backend validates and persists new version data.
5. Collaboration channel propagates updates to other sessions.

## Security and Permissions

- Role-gated editor access (authors/editors/administrators as configured).
- Server-side validation for save operations.
- Region-level editing and collision controls.

## Extension Points

- Add custom editor plugins and toolbar buttons.
- Integrate custom link/image/file tools.
- Extend save hooks for pre-save validation.

## Related Docs

- [Visual Editor](./visual-editor.md)
- [Code Editor](./code-editor.md)
- [Developer Article Lifecycle](../for-developers/article-lifecycle.md)

## Verification

This technical reference has served its purpose when you can map editor mode behavior to configured toolsets, trace the save lifecycle end to end, and identify where to extend or troubleshoot server and client integration points.
