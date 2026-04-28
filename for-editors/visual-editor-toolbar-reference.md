---
canonical_title: Visual Editor Toolbar Reference
description: Reference the common Visual Editor toolbar controls, mode availability, and typical usage patterns.
doc_type: Reference
product_area: editing
user_intent: understand-what-the-visual-editor-toolbar-controls-do
audience:
  - Content Editors
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Visual Editor Toolbar Reference

<!-- markdownlint-disable MD012 -->

## Summary

Use this page when you need to identify a toolbar control, understand which editing modes expose it, or confirm how a formatting or insert action behaves.

This page explains what each common toolbar button or dropdown does, how to use it, and where it is available.

## Mode legend

- `T` = title mode
- `S` = simple mode
- `N` = standard mode
- `A` = advanced mode

In title mode, the main toolbar has no standard action buttons. Only the title mode indicator is shown, and text selection exposes a minimal balloon (`bold`, `italic`).

## Common toolbar actions

| Tool | Icon | Type | What it does | How to use | Modes |
| --- | --- | --- | --- | --- | --- |
| Heading | ![Heading](../assets/images/ckeditor/toolbar-icons/heading2.svg) | Dropdown | Changes selected text to heading levels. | Select text, choose heading level. | S, N, A |
| Paragraph | ![Paragraph](../assets/images/ckeditor/toolbar-icons/paragraph.svg) | Button | Converts block back to paragraph text. | Place cursor in block, click paragraph. | S, N, A |
| Bold | ![Bold](../assets/images/ckeditor/toolbar-icons/bold.svg) | Toggle | Applies strong emphasis. | Select text, click once to apply, again to remove. | T, S, N, A |
| Italic | ![Italic](../assets/images/ckeditor/toolbar-icons/italic.svg) | Toggle | Applies light emphasis. | Select text, click italic. | T, S, N, A |
| Underline | ![Underline](../assets/images/ckeditor/toolbar-icons/underline.svg) | Toggle | Underlines selected text. | Select text, click underline. | S, N, A |
| Bulleted list | ![Bulleted list](../assets/images/ckeditor/toolbar-icons/bulleted-list.svg) | Toggle | Creates an unordered list. | Place cursor in line, click bulleted list. | S, N, A |
| Numbered list | ![Numbered list](../assets/images/ckeditor/toolbar-icons/numbered-list.svg) | Toggle | Creates an ordered list. | Place cursor in line, click numbered list. | S, N, A |
| Link | ![Link](../assets/images/ckeditor/toolbar-icons/link.svg) | Button/Dropdown | Inserts or edits links. | Select text and open link controls. | S, N, A |
| File link | ![File link](../assets/images/ckeditor/toolbar-icons/paper-clip.svg) | Button | Inserts a link to a file asset. | Select text and choose a file. | N |
| Image tools | ![Image](../assets/images/ckeditor/toolbar-icons/image.svg) | Dropdown | Opens image insert options. | Click image dropdown and choose source option. | N, A |
| From computer | ![Image upload](../assets/images/ckeditor/toolbar-icons/image-upload.svg) | Menu item | Uploads image from local machine. | Open image dropdown, choose From computer. | N, A |
| From website storage | ![Image asset manager](../assets/images/ckeditor/toolbar-icons/image-asset-manager.svg) | Menu item | Selects image from website media library. | Open image dropdown, choose From website storage. | N, A |
| From another website | ![Image URL](../assets/images/ckeditor/toolbar-icons/image-url.svg) | Menu item | Inserts an image by URL. | Open image dropdown, paste image URL. | N, A |
| Media embed | ![Media](../assets/images/ckeditor/toolbar-icons/media.svg) | Button | Embeds supported media like video URLs. | Click media, paste URL, confirm. | N, A |
| Table | ![Table](../assets/images/ckeditor/toolbar-icons/table.svg) | Dropdown | Inserts and configures tables. | Click table, choose size, then edit cells. | N, A |
| Quote | ![Quote](../assets/images/ckeditor/toolbar-icons/quote.svg) | Toggle | Styles a block as quotation text. | Place cursor in paragraph, click quote. | S, N, A |
| Undo | ![Undo](../assets/images/ckeditor/toolbar-icons/undo.svg) | Button | Reverts the last change. | Click undo repeatedly as needed. | S, N |
| Redo | ![Redo](../assets/images/ckeditor/toolbar-icons/redo.svg) | Button | Reapplies an undone change. | Click redo after undo. | S, N |
| To-do list | ![To-do list](../assets/images/ckeditor/toolbar-icons/todo-list.svg) | Toggle | Creates checklist-style items. | Place cursor in line, click to-do list. | N, A |
| Indent | ![Indent](../assets/images/ckeditor/toolbar-icons/indent.svg) | Button | Increases indentation. | Place cursor in list or paragraph and click indent. | A |
| Outdent | ![Outdent](../assets/images/ckeditor/toolbar-icons/outdent.svg) | Button | Decreases indentation. | Place cursor in list or paragraph and click outdent. | A |
| Code block | ![Code block](../assets/images/ckeditor/toolbar-icons/code-block.svg) | Button | Formats content as preformatted code. | Select text or insert at cursor. | A |

## Link dropdown options

| Option | Icon | Purpose | Modes |
| --- | --- | --- | --- |
| From website page | ![Internal link](../assets/images/ckeditor/toolbar-icons/link.svg) | Link to another page in the same site. | N, A |
| From another website | ![External link](../assets/images/ckeditor/toolbar-icons/web.svg) | Link to an external URL. | N, A |

## Image dropdown options

| Option | Icon | Purpose | Modes |
| --- | --- | --- | --- |
| From computer | ![From computer](../assets/images/ckeditor/toolbar-icons/image-upload.svg) | Upload a local image file. | N, A |
| From website storage | ![From website storage](../assets/images/ckeditor/toolbar-icons/image-asset-manager.svg) | Choose an existing uploaded image. | N, A |
| From another website | ![From another website](../assets/images/ckeditor/toolbar-icons/image-url.svg) | Insert an image URL hosted elsewhere. | N, A |

## Notes

- Toolbar composition can be customized per tenant, template, or region.
- If a tool is missing in your environment, your current mode or permissions may not allow it.
- For mode overview visuals, see [Visual Editor Technical Reference](./visual-editor-technical-reference.md).

## Verification

This reference is effective when you can match a toolbar icon or dropdown to its purpose and confirm whether the current editing mode should expose that control.

## Related guides

- [Visual Editor](./visual-editor.md)
- [Visual Editor Visual Guide](./visual-editor-visual-guide.md)
- [Visual Editor Technical Reference](./visual-editor-technical-reference.md)

Use these guides together when you need both control-level detail and full editor workflow context.

<!-- markdownlint-enable MD012 -->

