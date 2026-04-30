---
canonical_title: Changelog
description: Track notable SkyCMS documentation and platform release updates using a consistent entry format.
doc_type: Reference
product_area: release-management
user_intent: review-notable-release-and-doc-changes
audience:
  - Developers
  - Administrators
  - Contributors
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-30
---

# Changelog

## Summary

Notable SkyCMS documentation and platform release changes, in reverse chronological order.

## Versioning policy

Use semantic versioning concepts for release communication:

- major for breaking changes,
- minor for backward-compatible features,
- patch for backward-compatible fixes.

When exact product versioning differs by component, call out scope clearly in each entry.

## Entry format

Use this structure for new entries:

### YYYY-MM-DD

- Scope:
- Change type:
- Summary:
- Impact:
- Required action:
- Related links:

## Current release notes

### 2026-04-30

- Scope: File Manager UI refresh (v12.3.0).
- Change type: Feature — new elFinder-based file browser replaces legacy server-rendered file explorer.
- Summary:
  - The File Manager now uses the elFinder 2.1 open-source file browser under the hood (`SkyCMS.Drivers.ElFinder` CQRS driver).
  - FilePond replaces the previous chunked-upload widget. Files can be dropped anywhere on the page; uploads target the folder currently open in elFinder.
  - All file operations (create, rename, copy, cut, paste, delete, download, search, sort, view toggle) are now available via the elFinder toolbar and right-click context menu.
  - The legacy server-rendered file manager UI is still available via the `UseModernFileExplorer = false` setting for backwards compatibility.
  - Documentation updated: [File Manager](../for-editors/file-manager.md), [File Manager Quick Start](../for-editors/file-manager-quickstart.md), [File Manager Toolbar Reference](../for-editors/file-manager-toolbar-reference.md).
- Impact: Editors see a new, more capable File Manager interface by default.
- Required action: None for most users. Administrators who relied on any custom extensions to the old UI should review the [File Manager Toolbar Reference](../for-editors/file-manager-toolbar-reference.md) to verify expected controls are present.
- Related links:
  - [File Manager](../for-editors/file-manager.md)
  - [File Manager Quick Start](../for-editors/file-manager-quickstart.md)
  - [File Manager Toolbar Reference](../for-editors/file-manager-toolbar-reference.md)


### 2026-04-27

- Scope: Documentation standards and adoption-focused rewrite wave.
- Change type: Documentation quality and structure improvements.
- Summary:
  - Added documentation visual style standard integration.
  - Rewrote deployment and troubleshooting references to adoption-first format.
  - Removed TODO/stub content from key entry and reference pages.
- Impact: Faster onboarding and clearer operational guidance for contributors and adopters.
- Required action: None.
- Related links:
  - [Documentation Standards Stack v1](../for-developers/documentation-standards-stack-v1.md)
  - [Documentation Visual Style Standard](../for-developers/documentation-visual-style-standard.md)
  - [Documentation Adoption Priority Plan](../for-developers/documentation-adoption-priority-plan.md)

## Related guides

- [Documentation Rollout Plan](../for-developers/documentation-rollout-plan.md)
- [Deployment Overview](../deployment/overview.md)
- [Troubleshooting](troubleshooting.md)
