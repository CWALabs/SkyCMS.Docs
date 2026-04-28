---
canonical_title: Creating Editable Areas
description: A practical guide for developers to define editable regions in templates and stand-alone articles, using the code editor (Monaco) with CKEditor-based Visual Editor.
doc_type: How-to
product_area: development
user_intent: implement-creating-editable-areas
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Creating Editable Areas

## Summary

A practical guide for developers to define editable regions in templates and stand-alone articles, using the code editor (Monaco) with CKEditor-based Visual Editor.

## Quick Start (5 minutes)

- Mark editable regions with `data-ccms-ceid="my-id"` (or `data-ccms-new="true"` for auto-GUID on first save).
- Use block elements for rich content (e.g., `div`, `section`, `article`) and add `class="ck-content"` so CKEditor styles apply.
- Use headings (`h1`–`h6`) or `data-editor-config="title"`/`"heading"` for minimal toolbar (no embeds/tables).
- Use `data-editor-config="simple"`, `"standard"`, or `"advanced"` to explicitly control toolbar richness; omit the attribute for the `standard` default.
- Use the image widget via `data-editor-config="image-widget"`; first image is typically treated as the page banner.
- Do **not** nest editable regions; backend rejects nested regions.

## Element Types & Toolbar Behavior

| Use Case | HTML | Config/Classes | Toolbar |
| --- | --- | --- | --- |
| Title/subtitle | `<h1>`–`<h6>` or any block with `data-editor-config="title"`/`"heading"` | `data-ccms-ceid` | Minimal toolbar (bold/italic only) |
| Simple text | any block | `data-ccms-ceid` + `data-editor-config="simple"` + `class="ck-content"` | Compact toolbar (basic formatting + links) |
| Standard content | any block | `data-ccms-ceid` + `class="ck-content"` | Standard toolbar — default when `data-editor-config` is omitted |
| Advanced content | any block | `data-ccms-ceid` + `data-editor-config="advanced"` + `class="ck-content"` | Full toolbar (images, media, tables, lists, code blocks, etc.) |
| Image widget | `<div data-editor-config="image-widget">` | `data-ccms-ceid` or `data-ccms-new` + `class="ck-content"` | FilePond-based upload UI |

Notes:
- `ck-content` keeps rendered content aligned with CKEditor’s CSS; avoid overriding its base rules.
- Additional block tags are allowed; prefer semantic blocks for layout.

## Required Data Attributes

- `data-ccms-ceid`: Stable ID for the region. Use descriptive IDs when practical.
- `data-ccms-new="true"`: Auto-assigns a GUID on first save (shared generator across widgets/editors).
- `data-editor-config` (optional): `title` or `heading` for minimal toolbar; `simple`, `standard`, or `advanced` to explicitly select toolbar richness; `image-widget` for image uploads. Omit for standard rich content (defaults to `standard`).
- Optional for image widget: `data-ccms-enable-alt-editor="true"` to enable the alt/title modal per widget.

## Examples

Rich body block:
```html
<section data-ccms-ceid="body" class="ck-content">
  <p>Welcome to our product page.</p>
</section>
```

Title/subtitle:
```html
<h1 data-ccms-ceid="page-title" data-editor-config="title">Product Name</h1>
<h2 data-ccms-ceid="page-subtitle" data-editor-config="heading">Great tagline goes here</h2>
```

Image widget (auto-ID on first save):
```html
<div data-editor-config="image-widget" data-ccms-new="true" class="ck-content"></div>
```

Image widget with opt-in alt/title editor:
```html
<div data-editor-config="image-widget"
     data-ccms-new="true"
     data-ccms-enable-alt-editor="true"
     class="ck-content"></div>
```

## Rules & Conventions

- **No nesting:** Do not place an editable element inside another; backend validation will reject it and nested regions may be removed.
- **Stable IDs:** Keep `data-ccms-ceid` stable between template updates so content maps correctly.
- **Banner image convention:** The first image uploaded on a page is treated as the banner image by convention.
- **Iframe context:** Visual Editor runs inside an iframe; parent functions handle saving and autosave.
- **Autosave:** CKEditor autosaves after ~1s idle when `parent.enableAutoSave` is true.

## Styling Guidance

- Apply `ck-content` to non-title editable areas so CKEditor’s content CSS (ckeditor5-content.css) styles lists, tables, images, etc.
- Avoid overriding `.ck-content` base rules; layer your component/page classes instead.
- Headings with minimal toolbar do **not** require `ck-content`, but can have it if you need consistent typography.

## Image Widget Highlights

- Uses FilePond uploads; supports drag/drop, replace, library browsing, delete.
- Upload path: `/pub/articles/{articleNumber}/` when `articleNumber` is available; otherwise `/pub/images/`.
- Alt/Title modal is enabled per widget via `data-ccms-enable-alt-editor="true"`; global toggle via `CCMS_IMAGE_WIDGET_CONFIG.enableAltTextEditor`.
- Emits custom events via `window.CCMSImageWidgetEvents` (`imageChanged` with `{ type, id, element, imageSrc }`).

## Duplicator Pattern (Reusable Blocks)

Use the duplicator to clone repeatable sections (e.g., cards, FAQs, feature rows):

- Wrap repeatable items with classes/components the duplicator expects (see `Editor/wwwroot/lib/cosmos/dublicator/dublicator.js`).
- Each cloned child should contain editable elements with `data-ccms-ceid` (or `data-ccms-new`).
- On clone, editors/widgets are re-initialized; on delete, editors/widgets are torn down to save the page body cleanly.
- New clones automatically get fresh `data-ccms-ceid` values to avoid ID collisions; avoid nesting editable regions inside each other.

Minimal pattern example:
```html
<div class="ccms-clone" data-ccms-ceid="feature-1">
  <h3 data-ccms-ceid="feature-1-title" data-editor-config="heading">Fast</h3>
  <div data-ccms-ceid="feature-1-body" class="ck-content">Our platform is fast.</div>
</div>
```
Then call `Duplicator.create(element)` on each clone container in script.

## Troubleshooting

- **Editable regions missing in Visual Editor:** Check for `data-ccms-ceid` (or `data-ccms-new`) and ensure no nesting.
- **Content lost after template update:** IDs changed or regions removed; keep IDs stable.
- **Toolbar too minimal:** Remove `data-editor-config="title"/"heading"` or switch to a non-heading block for rich content.
- **Image widget not initializing:** Ensure `data-editor-config="image-widget"` and that FilePond scripts are loaded.
- **Styling looks off:** Confirm `class="ck-content"` on rich areas and avoid overriding CKEditor base styles.

## See Also

- Templates guide: [../../for-site-builders/templates.md](../../for-site-builders/templates.md)
- Visual Editor reference: [../../for-editors/visual-editor.md](../../for-editors/visual-editor.md)
- Visual Editor technical reference: [../../for-editors/visual-editor-technical-reference.md](../../for-editors/visual-editor-technical-reference.md)
- Duplicator code: [SkyCMS source on GitHub](https://github.com/CWALabs/SkyCMS/blob/main/Editor/wwwroot/lib/cosmos/dublicator/dublicator.js)
- Image widget code: [SkyCMS source on GitHub](https://github.com/CWALabs/SkyCMS/blob/main/Editor/wwwroot/lib/cosmos/image-widget/image-widget.js)
- CKEditor content CSS: [SkyCMS source on GitHub](https://github.com/CWALabs/SkyCMS/blob/main/Editor/wwwroot/lib/ckeditor/ckeditor5-content.css)
