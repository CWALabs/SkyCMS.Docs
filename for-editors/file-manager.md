---
canonical_title: File Manager
description: Reference the SkyCMS File Manager for uploads, organization, editing, permissions, and common troubleshooting.
doc_type: Reference
product_area: editing
user_intent: understand-file-manager-capabilities-and-operations
audience:
	- Content Editors
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# File Manager

## Summary

Use this guide when you need to:

- upload, organise, move, or delete files and folders,
- understand which file operations are available and to whom,
- troubleshoot File Manager behaviour such as upload failures or editor issues.

## Overview

The SkyCMS File Manager is a browser-based interface for managing website assets. You can upload, organise, edit, and delete files without FTP or command-line access. All publicly accessible files live under the `/pub` directory.

Key capabilities:

- Drag-and-drop uploads with chunked support for large files.
- Built-in Monaco code editor for HTML, CSS, JavaScript, JSON, and XML.
- Integrated Filerobot image editor for in-browser image adjustments.
- Bulk move, copy, and delete operations.
- Thumbnail gallery view for images.
- Copy-to-clipboard URL shortcut for any file.

## What this page covers

Use this page as the operational reference for everyday file work. If you want a shorter onboarding path, start with [File Manager Quick Start](./file-manager-quickstart.md) and return here when you need more detail.

### Permissions

| Role | Access |
| --- | --- |
| Administrator | Full access |
| Editor | Full access |
| Author | Full access |
| Team Member | Full access |
| Reviewer | Read-only |

## Accessing the File Manager

1. Log in to the SkyCMS editor.
2. Click **Files** in the toolbar, or open it from the main navigation.
3. The File Manager opens at the `/pub` directory.

When editing an article or template, the File Manager automatically opens in that content's asset folder. The breadcrumb shows the article title instead of the folder number.

## Interface overview

| Element | Purpose |
| --- | --- |
| Breadcrumb trail | Shows and navigates the current folder path |
| New folder field | Text field + **Create** button to add a subfolder |
| Upload zone | Drag-and-drop area; also click to browse |
| Action buttons | New file, Rename, Delete, Copy/Move, Clear Selected, Show Selected, Thumbnail toggle |
| File/folder grid | List or thumbnail view of current folder contents |
| Pagination controls | Navigate pages; set items per page; sort options |

## File and folder operations

### Create a folder

1. Navigate to the parent folder.
2. Enter the new name in the folder field next to the breadcrumb.
3. Click **Create**.

Avoid spaces and special characters in folder names — use hyphens or underscores instead.

### Create a new file

1. Click **New file**.
2. Enter a name with a supported extension (`.html`, `.css`, `.js`, `.json`, `.xml`, `.txt`).
3. Click **Create** — the code editor opens automatically.

### Select files

- Click the checkbox next to any item to select it.
- Check multiple boxes for bulk operations.
- Use **Show Selected** to review the full selection across folders.
- Use **Clear Selected** to deselect everything.

### Rename

1. Select exactly one item.
2. Click **Rename**.
3. Enter the new name and click **Change**.

Changing the file extension shows a warning — only do this if you intend to change the file type.

### Delete

1. Select one or more items.
2. Click **Delete**.
3. Confirm in the dialog.

Deletion is permanent and cannot be undone. Verify your selection before confirming.

### Copy or move

1. Select the items to copy or move.
2. Click **Copy/Move**.
3. Navigate to the destination folder.
4. Click **Copy to here** or **Move to here**.

You cannot create or modify files outside the `/pub` directory.

### Download a file

Click the file name in list view, or click **Download** on an image card.

## Uploading files

### Drag and drop

1. Navigate to the target folder.
2. Drag files from your computer into the upload zone.
3. Upload progress appears per file.

### Browse and select

1. Click inside the upload zone.
2. Select files in the system dialog and click **Open**.

### Upload behaviour

- Files larger than 25 MB are automatically split into 5 MB chunks for reliable uploads.
- Multiple files upload simultaneously.
- Interrupted chunked uploads can resume from the last successful chunk.
- Folder structure from your local system is preserved if you upload with paths.

### Supported file types with special handling

**Editable code files:** `.html`, `.htm`, `.css`, `.js`, `.json`, `.xml`, `.txt`

**Editable images:** `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`

**Preview-only images:** `.apng`, `.avif`, `.svg`

All other file types can be uploaded and downloaded but have no built-in editor.

## Editing files

### Code editor

Open any supported code file by clicking the Monaco editor icon in the file list. For full feature details, see [Code Editor](./code-editor.md).

Supported extensions: `.html`, `.htm`, `.css`, `.js`, `.json`, `.xml`, `.txt`

### Image editor

Open any supported image by clicking the Filerobot icon. For full feature details, see [Image Editing](./image-editing.md).

Supported formats: `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`

Saves replace the original — keep a backup before making major edits.

## Image management

### Thumbnail view

Click **Show image thumbnails** to switch to gallery card view. Each card shows a preview, file info, and quick-action buttons. Click **Show file list** to return to list view.

### Copy a file URL

1. Click the clipboard icon next to any file.
2. The URL is copied — paste it wherever needed.

URLs follow the pattern: `https://yourdomain.com/pub/path/to/file.jpg`

### Image tips

- Upload images at their intended display dimensions where possible.
- Use JPEG for photographs, PNG for graphics with transparency, WebP for smaller file sizes.
- The File Manager generates 120×120 px thumbnails automatically for card view.

## Advanced features

### Sorting

Click any column header to sort by name, type, modified date, or size. Click again to reverse the order.

### Pagination

Use the controls at the top and bottom of the file list to change page or set items per page (10, 20, 50, 100).

### Image selection mode

When inserting images into a page or article, File Manager enters image selection mode: only images can be selected and the view switches to thumbnails automatically. Selecting an image inserts it immediately.

## Troubleshooting

### Uploads fail or stall

- Verify the file is under 25 MB, or wait for chunked upload to resume.
- Check your internet connection.
- Confirm you have upload permissions in the current folder.
- Check available storage space on the server.

### Code editor won't load

- Clear browser cache and try again.
- Disable browser extensions or test in a private window.
- Use a supported modern browser (Chrome, Firefox, Edge).

### Can't save in code editor

- Confirm you are still logged in (session may have expired).
- Check you have write permissions in that folder.
- Look for syntax errors preventing save — correct them and retry.

### Image editor won't open

- Very large images may fail to load — try a smaller version first.
- Verify the format is supported.
- Clear the browser cache and retry.

### Can't navigate to a folder

- Confirm you have access — some folders may be restricted.
- Use the breadcrumb trail to navigate instead of direct URL.
- Refresh the page to reset the interface state.

### Performance is slow

- Reduce items per page.
- Switch from thumbnail view to list view.
- Close unused browser tabs.

## Verification

File Manager is working as expected when you can:

- open the correct folder path,
- upload and retrieve files successfully,
- rename, move, or delete items with the expected permissions,
- launch the code or image editor for supported file types.

## Related guides

- [File Manager Quick Start](./file-manager-quickstart.md)
- [File Manager Toolbar Reference](./file-manager-toolbar-reference.md)
- [Code Editor](./code-editor.md)
- [Image Editing](./image-editing.md)
- [Creating Articles](./creating-articles.md)
