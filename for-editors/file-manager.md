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
last_reviewed: 2026-04-30
---

# File Manager

## Summary

Use this guide when you need to:

- upload, organise, move, or delete files and folders,
- understand which file operations are available and to whom,
- troubleshoot File Manager behaviour such as upload failures or editor issues.

## Overview

The SkyCMS File Manager is a browser-based interface built on [elFinder 2.1](https://github.com/Studio-42/elFinder). You can upload, organise, edit, and delete files without FTP or command-line access. All publicly accessible files live under the `/pub` directory.

Key capabilities:

- Full-featured toolbar with Back, Forward, Home, Up, New Folder, New File, Copy, Cut, Paste, Rename, Delete, Search, and Sort.
- FilePond upload panel with drag-anywhere support and chunked upload (5 MB chunks) for large files.
- Built-in Monaco code editor for HTML, CSS, JavaScript, JSON, and XML (opened via elFinder's Open action).
- Integrated Filerobot image editor for in-browser image adjustments (opened via elFinder's Open action).
- Bulk copy, move, and delete via toolbar or right-click context menu.
- Thumbnail preview for images.
- On-demand thumbnail generation (120 × 120 px).

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

The File Manager has two main areas: the **upload panel** at the top and the **elFinder browser** below it.

| Element | Purpose |
| --- | --- |
| Upload panel | **Upload Files** button and FilePond drop zone — drop files anywhere on the page to trigger it |
| elFinder toolbar | All file operations: navigation, create, copy, paste, delete, rename, search, view toggle, sort |
| Folder tree (left pane) | Collapsible tree showing folder hierarchy under `/pub` |
| File/folder area (right pane) | Grid or list view of the current folder's contents |
| Breadcrumb | Shows current path; click any segment to navigate up |
| Status bar | Shows selected item count and folder details |

For a control-by-control breakdown of every toolbar button, see [File Manager Toolbar Reference](./file-manager-toolbar-reference.md).

## File and folder operations

### Create a folder

1. Navigate to the parent folder.
2. Click **New Folder** in the toolbar (folder icon with a plus).
3. Type the new name and confirm.

Avoid spaces and special characters in folder names — use hyphens or underscores instead.

### Create a new file

1. Click **New File** in the toolbar (file icon).
2. Enter a name with a supported extension (`.html`, `.css`, `.js`, `.json`, `.xml`, `.txt`).
3. Confirm — elFinder creates the file and the code editor can be opened from the context menu.

### Select files

- **Single select:** Click an item.
- **Multi-select:** Hold **Ctrl** (or **Cmd** on Mac) and click additional items.
- **Range select:** Hold **Shift** and click to select a contiguous range.
- **All:** Press **Ctrl+A** (or **Cmd+A**) to select all items in the current folder.

### Rename

1. Select exactly one item.
2. Click **Rename** in the toolbar, or right-click and choose **Rename**.
3. Enter the new name and confirm.

Changing the file extension shows a warning — only do this if you intend to change the file type.

### Delete

1. Select one or more items.
2. Click **Delete** in the toolbar (trash icon), or right-click and choose **Delete**.
3. Confirm in the dialog.

Deletion is permanent and cannot be undone. Verify your selection before confirming.

### Copy or move

**Copy:**
1. Select the items to copy.
2. Click **Copy** in the toolbar (or right-click → **Copy**).
3. Navigate to the destination folder.
4. Click **Paste** in the toolbar — a copy is created.

**Move:**
1. Select the items to move.
2. Click **Cut** in the toolbar (or right-click → **Cut**).
3. Navigate to the destination folder.
4. Click **Paste** — the items are moved.

You cannot create or modify files outside the `/pub` directory.

### Download a file

1. Select the file.
2. Click **Download** in the toolbar, or right-click → **Download**.

## Uploading files

The File Manager uses **FilePond** for all uploads. There is a dedicated upload panel above the elFinder browser.

### Drag and drop (anywhere on the page)

1. Navigate to the target folder in the File Manager.
2. Drag files from your computer and drop them anywhere on the browser page.
3. The FilePond panel expands automatically and files begin uploading immediately.
4. Each file shows individual progress. When all uploads finish the panel collapses and the folder refreshes.

### Browse and select

1. Click the **Upload Files** button at the top of the File Manager.
2. Select one or more files in the system dialog and click **Open**.
3. Files upload to the currently open folder.

### Upload behaviour

- Files are uploaded as 5 MB chunks for reliability on large files.
- Multiple files upload simultaneously with individual per-file progress.
- Uploads always target the folder currently open in the file browser.
- After all uploads succeed, elFinder reloads the current folder automatically.

### Supported file types with special handling

**Editable code files:** `.html`, `.htm`, `.css`, `.js`, `.json`, `.xml`, `.txt`

**Editable images:** `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`

**Preview-only images:** `.apng`, `.avif`, `.svg`

All other file types can be uploaded and downloaded but have no built-in editor.

## Editing files

### Code editor

1. Right-click a supported code file and choose **Open**, or select it and click **Open** in the toolbar.
2. The Monaco code editor opens with syntax highlighting.
3. Press **Ctrl+S** (or **Cmd+S** on Mac) to save.

For full feature details, see [Code Editor](./code-editor.md).

Supported extensions: `.html`, `.htm`, `.css`, `.js`, `.json`, `.xml`, `.txt`

### Image editor

1. Right-click a supported image and choose **Open**, or select it and click **Open** in the toolbar.
2. The Filerobot image editor opens with crop, resize, annotate, and filter tools.
3. Click **Save** to replace the original.

For full feature details, see [Image Editing](./image-editing.md).

Supported formats: `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`

Saves replace the original — keep a backup before making major edits.

## Image management

### Thumbnail view

Click the **View** button in the toolbar (or right-click → **View**) to switch between icon/thumbnail view and list view. Thumbnails are generated automatically at 120 × 120 px on first request.

### Copy a file URL

Right-click a file and choose **Get URL**, or use the **Info** toolbar button and copy the URL from the properties panel.

URLs follow the pattern: `https://yourdomain.com/pub/path/to/file.jpg`

### Image tips

- Upload images at their intended display dimensions where possible.
- Use JPEG for photographs, PNG for graphics with transparency, WebP for smaller file sizes.
- The File Manager generates 120 × 120 px thumbnails automatically when a folder is viewed in thumbnail mode.

## Advanced features

### Sorting

Click **Sort** in the toolbar to choose the sort field and direction. You can sort by name, type, modified date, or file size.

### Search

Click **Search** in the toolbar to filter the current folder by filename. Results update as you type.

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
- Use the breadcrumb trail to navigate up to a known-good path.
- Click **Reload** in the toolbar to reset the interface state.

### Performance is slow

- Reduce items per page.
- Switch from thumbnail view to list view.
- Close unused browser tabs.

## Verification

File Manager is working as expected when you can:

- open the correct folder path,
- upload and retrieve files successfully,
- rename, move, or delete items with the expected permissions,
- launch the code or image editor via the toolbar or right-click menu for supported file types.

## Related guides

- [File Manager Quick Start](./file-manager-quickstart.md)
- [File Manager Toolbar Reference](./file-manager-toolbar-reference.md)
- [Code Editor](./code-editor.md)
- [Image Editing](./image-editing.md)
- [Creating Articles](./creating-articles.md)
