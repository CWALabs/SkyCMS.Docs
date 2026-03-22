<!-- Audience: Developers and Administrators -->
<!-- Type: Technical Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Editors/LiveEditor/TechnicalReference.md -->

# Page Editor Technical Reference

This page captures technical details of the Page Editor implementation for developers and administrators.

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

- [Page Editor](./page-editor.md)
- [Code Editor](./code-editor.md)
- [Developer Article Lifecycle](../for-developers/article-lifecycle.md)
