---
canonical_title: File Manager Toolbar Reference
description: Reference each control in the modern SkyCMS File Manager toolbar, including behavior, icon, and expected server interaction.
doc_type: Reference
product_area: editing
user_intent: understand-what-each-file-manager-toolbar-control-does
audience:
  - Content Editors
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# File Manager Toolbar Reference

## Summary

Use this page when you need a control-by-control reference for the modern File Manager toolbar.

This page documents each button currently shown in the modern SkyCMS File Manager toolbar, including the icon used for each button.

## Scope and source of truth

- Toolbar layout source: `SkyCMS/Editor/Views/Shared/FileExplorer/IndexModern.cshtml`
- Connector command source: `SkyCMS/Editor/Controllers/ElFinderConnectorController.cs`
- Icon mapping source: `SkyCMS/Editor/wwwroot/lib/elfinder/css/theme-bootstrap-libreicons-svg.css`

The list below reflects the modern toolbar order configured in SkyCMS today.

## Toolbar button legend

- **Type**: `Button` executes immediately, `Toggle` cycles a mode, `Panel` opens interactive UI.
- **Server call**: `Yes` means the action typically triggers a connector request. `No` means it is client-side UI behavior.

## Modern toolbar buttons

| Order | Button | Icon | Type | What it does | Server call |
| --- | --- | --- | --- | --- | --- |
| 1 | Back | ![Back](../assets/images/file-manager/toolbar-icons/libre-chevron-left.svg) | Button | Moves to previous navigation location in File Manager history. | No |
| 2 | Forward | ![Forward](../assets/images/file-manager/toolbar-icons/libre-chevron-right.svg) | Button | Moves to next navigation location after using Back. | No |
| 3 | Reload | ![Reload](../assets/images/file-manager/toolbar-icons/libre-refresh.svg) | Button | Refreshes the current folder listing and state. | Yes (`open`) |
| 4 | Home | ![Home](../assets/images/file-manager/toolbar-icons/libre-home.svg) | Button | Jumps to the root File Manager folder for the active volume. | Yes (`open`) |
| 5 | Up | ![Up](../assets/images/file-manager/toolbar-icons/libre-level-up.svg) | Button | Navigates to the parent folder of the current folder. | Yes (`open`) |
| 6 | New Folder (`mkdir`) | ![New Folder](../assets/images/file-manager/toolbar-icons/libre-folder-open.svg) | Button | Creates a new folder in the current location. | Yes (`mkdir`) |
| 7 | New File (`mkfile`) | ![New File](../assets/images/file-manager/toolbar-icons/libre-file.svg) | Button | Creates a new blank text/code file in the current location. | Yes (`mkfile`) |
| 8 | Open | ![Open](../assets/images/file-manager/toolbar-icons/libre-folder-open.svg) | Button | Opens selected folder or file using default action. | Yes (`open`/`file`) |
| 9 | Download | ![Download](../assets/images/file-manager/toolbar-icons/libre-download.svg) | Button | Downloads selected file(s). | Yes (`file`) |
| 10 | Info | ![Info](../assets/images/file-manager/toolbar-icons/libre-exclamation-circle.svg) | Panel | Shows metadata and properties for selected item(s). | Yes (`info`) |
| 11 | Quick Look | ![Quick Look](../assets/images/file-manager/toolbar-icons/libre-view.svg) | Panel | Opens preview mode for supported file types. | Mostly No |
| 12 | Copy | ![Copy](../assets/images/file-manager/toolbar-icons/libre-copy.svg) | Button | Copies selected items to clipboard-like buffer. | No (until paste) |
| 13 | Cut | ![Cut](../assets/images/file-manager/toolbar-icons/libre-cut.svg) | Button | Marks selected items to be moved on paste. | No (until paste) |
| 14 | Paste | ![Paste](../assets/images/file-manager/toolbar-icons/libre-paste.svg) | Button | Pastes copied/cut items into current folder (copy or move). | Yes (`paste`) |
| 15 | Delete (`rm`) | ![Delete](../assets/images/file-manager/toolbar-icons/libre-trash.svg) | Button | Deletes selected files or folders after confirmation. | Yes (`rm`) |
| 16 | Rename | ![Rename](../assets/images/file-manager/toolbar-icons/libre-text-cursor.svg) | Button | Renames selected file or folder. | Yes (`rename`) |
| 17 | Search | ![Search](../assets/images/file-manager/toolbar-icons/libre-search.svg) | Panel | Filters visible items by search query. | Can call (`search`) |
| 18 | View | ![View](../assets/images/file-manager/toolbar-icons/libre-layout-blocks.svg) | Toggle | Switches between icon/grid and list display layouts. | No |
| 19 | Sort | ![Sort](../assets/images/file-manager/toolbar-icons/libre-sort.svg) | Panel | Changes sort field and direction in current view. | No |

### Alternate icon in view toggle

When list view is active, the toolbar can show the list icon variant:

![List view icon](../assets/images/file-manager/toolbar-icons/libre-layout-list.svg)

## Upload controls in modern File Manager

SkyCMS uses a hybrid upload model:

- elFinder toolbar upload command is intentionally removed in the modern view.
- A dedicated **Upload Files** button is rendered above the toolbar.
- External drag and drop into the file manager area is intercepted and sent to FilePond.
- Uploads are targeted to the folder currently open in the file manager.

| Control | Icon | What it does |
| --- | --- | --- |
| Upload Files | ![Upload](../assets/images/file-manager/toolbar-icons/libre-upload.svg) | Opens the system file picker via FilePond and uploads to current folder. |
| Drag and drop upload | Same upload flow | Dropping local files on the manager area starts FilePond upload for current folder. |

## Notes

- Some buttons are disabled when no item is selected or when current permissions do not allow the action.
- Reviewer role is read-only and may see disabled create/edit/delete controls.
- In integration modes (for example image picker), available actions can be filtered.

## Verification

Use this reference successfully when you can match a visible toolbar control to its expected action and determine whether it changes only the client UI or also calls the file connector.

## Related guides

- [File Manager](./file-manager.md)
- [File Manager Quick Start](./file-manager-quickstart.md)
