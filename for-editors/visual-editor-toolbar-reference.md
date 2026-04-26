<!-- Audience: Content Editors -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Editors/LiveEditor/ToolbarReference.md -->

# Visual Editor Toolbar Reference

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
| Heading | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/heading2.svg" alt="Heading" width="16" /> | Dropdown | Changes selected text to heading levels. | Select text, choose heading level. | S, N, A |
| Paragraph | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/paragraph.svg" alt="Paragraph" width="16" /> | Button | Converts block back to paragraph text. | Place cursor in block, click paragraph. | S, N, A |
| Bold | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/bold.svg" alt="Bold" width="16" /> | Toggle | Applies strong emphasis. | Select text, click once to apply, again to remove. | T, S, N, A |
| Italic | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/italic.svg" alt="Italic" width="16" /> | Toggle | Applies light emphasis. | Select text, click italic. | T, S, N, A |
| Underline | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/underline.svg" alt="Underline" width="16" /> | Toggle | Underlines selected text. | Select text, click underline. | S, N, A |
| Bulleted list | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/bulleted-list.svg" alt="Bulleted list" width="16" /> | Toggle | Creates an unordered list. | Place cursor in line, click bulleted list. | S, N, A |
| Numbered list | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/numbered-list.svg" alt="Numbered list" width="16" /> | Toggle | Creates an ordered list. | Place cursor in line, click numbered list. | S, N, A |
| Link | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/link.svg" alt="Link" width="16" /> | Button/Dropdown | Inserts or edits links. | Select text and open link controls. | S, N, A |
| File link | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/paper-clip.svg" alt="File link" width="16" /> | Button | Inserts a link to a file asset. | Select text and choose a file. | N |
| Image tools | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image.svg" alt="Image" width="16" /> | Dropdown | Opens image insert options. | Click image dropdown and choose source option. | N, A |
| From computer | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image-upload.svg" alt="Image upload" width="16" /> | Menu item | Uploads image from local machine. | Open image dropdown, choose From computer. | N, A |
| From website storage | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image-asset-manager.svg" alt="Image asset manager" width="16" /> | Menu item | Selects image from website media library. | Open image dropdown, choose From website storage. | N, A |
| From another website | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image-url.svg" alt="Image URL" width="16" /> | Menu item | Inserts an image by URL. | Open image dropdown, paste image URL. | N, A |
| Media embed | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/media.svg" alt="Media" width="16" /> | Button | Embeds supported media like video URLs. | Click media, paste URL, confirm. | N, A |
| Table | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/table.svg" alt="Table" width="16" /> | Dropdown | Inserts and configures tables. | Click table, choose size, then edit cells. | N, A |
| Quote | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/quote.svg" alt="Quote" width="16" /> | Toggle | Styles a block as quotation text. | Place cursor in paragraph, click quote. | S, N, A |
| Undo | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/undo.svg" alt="Undo" width="16" /> | Button | Reverts the last change. | Click undo repeatedly as needed. | S, N |
| Redo | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/redo.svg" alt="Redo" width="16" /> | Button | Reapplies an undone change. | Click redo after undo. | S, N |
| To-do list | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/todo-list.svg" alt="To-do list" width="16" /> | Toggle | Creates checklist-style items. | Place cursor in line, click to-do list. | N, A |
| Indent | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/indent.svg" alt="Indent" width="16" /> | Button | Increases indentation. | Place cursor in list or paragraph and click indent. | A |
| Outdent | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/outdent.svg" alt="Outdent" width="16" /> | Button | Decreases indentation. | Place cursor in list or paragraph and click outdent. | A |
| Code block | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/code-block.svg" alt="Code block" width="16" /> | Button | Formats content as preformatted code. | Select text or insert at cursor. | A |

## Link dropdown options

| Option | Icon | Purpose | Modes |
| --- | --- | --- | --- |
| From website page | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/link.svg" alt="Internal link" width="16" /> | Link to another page in the same site. | N, A |
| From another website | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/web.svg" alt="External link" width="16" /> | Link to an external URL. | N, A |

## Image dropdown options

| Option | Icon | Purpose | Modes |
| --- | --- | --- | --- |
| From computer | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image-upload.svg" alt="From computer" width="16" /> | Upload a local image file. | N, A |
| From website storage | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image-asset-manager.svg" alt="From website storage" width="16" /> | Choose an existing uploaded image. | N, A |
| From another website | <img style="background:var(--ck-color-toolbar-background, #f3f4f6);border:1px solid var(--ck-color-toolbar-border, var(--ck-color-base-border, #d0d7de));border-radius:4px;padding:2px;vertical-align:middle;" src="../assets/images/ckeditor/toolbar-icons/image-url.svg" alt="From another website" width="16" /> | Insert an image URL hosted elsewhere. | N, A |

## Notes

- Toolbar composition can be customized per tenant, template, or region.
- If a tool is missing in your environment, your current mode or permissions may not allow it.
- For mode overview visuals, see [Visual Editor Technical Reference](./visual-editor-technical-reference.md).
