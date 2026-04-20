---
canonical_title: Layouts
description: Developer reference for layout entities, versioning, runtime resolution, import flows, and layout-to-template binding in SkyCMS.
audience:
	- Backend Developers
	- Full-Stack Developers
doc_type: Reference
status: Draft
entities:
	- layout
	- template
	- article
	- published-page
keywords:
	- layouts
	- layout resolution
	- layout versioning
	- site design
source: SkyCMS/Common/Data/Layout.cs, SkyCMS/Common/Data/Template.cs, SkyCMS/Common/Data/Logic/LayoutHelper.cs, SkyCMS/Editor/Features/Layouts/Create/CreateLayoutHandler.cs, SkyCMS/Editor/Features/Layouts/Delete/DeleteLayoutHandler.cs, SkyCMS/Editor/Features/Layouts/Import/ImportLayoutHandler.cs, SkyCMS/Editor/Services/Layouts/LayoutTemplateService.cs, SkyCMS/Editor/Services/Layouts/LayoutVersioningService.cs, SkyCMS/Editor/Services/Layouts/LayoutImportService.cs, SkyCMS/Editor/Controllers/LayoutsController.cs, SkyCMS/Editor/Controllers/BaseController.cs
---

# Layouts

## When to use this page

Use this guide when you need to:

- change layout data model or resolution behavior,
- implement layout import/versioning flows,
- diagnose layout/template runtime binding issues.

## Related guides

- Site-builder guide: [../for-site-builders/layouts.md](../for-site-builders/layouts.md)
- Layout/template/article hierarchy: [./layouts-templates-articles.md](./layouts-templates-articles.md)
- Developer overview: [./overview.md](./overview.md)

## Why This Matters

For developers, layouts are not just presentation assets. They are versioned data records that control the shared page shell used by templates and rendered pages.

In the canonical model, that shell ultimately participates in `Layout -> Template (optional) -> Article -> Published Page`.

That means layout work touches:

- Data modeling
- Runtime layout resolution
- Template binding
- Import/versioning flows
- Setup and preview behavior

## Core Model

### Layout entity

The `Layout` entity stores the reusable shell around page content.

Important fields:

- `Id`: unique row identity for a specific layout version.
- `LayoutNumber`: stable family identifier shared across versions of the same logical layout.
- `Version`: version number within that family.
- `IsDefault`: indicates the default site layout family/version.
- `Published`: timestamp used to determine whether the layout is active.
- `Head`, `BodyHtmlAttributes`, `HtmlHeader`, `FooterHtmlContent`: the actual layout payload.
- `CommunityLayoutId`: source identifier when imported from the community catalog.

### Template entity

Templates bind content structure to layouts.

Important fields:

- `LayoutId`: optional version pin to a specific layout row.
- `LayoutNumber`: preferred family-level binding to a layout family.
- `CommunityLayoutId`: import lineage.
- `Content`: page template body rendered inside the layout shell.

The key distinction is:

- `LayoutNumber` links templates to a layout family.
- `LayoutId` pins a template to a specific layout version.

## Runtime Resolution

### Active default layout

The runtime default layout is resolved through `LayoutHelper.GetCurrentDefaultLayoutAsync()`.

Current behavior:

- Filters layouts where `IsDefault == true`.
- Filters layouts where `Published <= now`.
- Orders by `Version` and returns the latest published version.

This means the active site layout is the latest published version of the default layout family, not simply the latest draft.

### Template lookup for the current layout

`BaseController.GetTemplatesForCurrentLayoutAsync()` resolves templates for the current layout using two paths:

- Preferred path: match `Template.LayoutNumber == Layout.LayoutNumber`.
- Compatibility path: if `Template.LayoutNumber == 0`, fall back to matching `Template.LayoutId == Layout.Id`.

That fallback exists to support unmigrated data.

## Layout Lifecycle

### Create

`CreateLayoutHandler` creates a brand-new layout family.

Behavior:

- Allocates the next `LayoutNumber`.
- Creates `Version = 1`.
- Creates the layout as non-default.
- Leaves publishing decisions to later flows.

### Edit and versioning

Editing the current default layout is intentionally versioned.

`LayoutsController.GetLayoutForEdit()`:

- Creates an initial default layout if none exists.
- If the current layout is default, creates a new draft version through `LayoutVersioningService.CreateNewVersionAsync()`.
- Carries forward family metadata and increments `Version`.
- Sets `Published = null` for the new draft version.

This protects the currently published default layout while a new draft is being edited.

### Delete

`DeleteLayoutHandler`:

- Refuses to delete the default layout.
- Removes templates pinned to the specific `LayoutId` being deleted.
- Deletes the layout row itself.

Deletion is row/version oriented, so developers need to be careful about family relationships versus pinned template relationships.

## Import and Community Layouts

### Import source

`LayoutImportService` loads community layouts and templates from the external catalog at `https://cwalabs.github.io/Cosmos.Starter.Designs`.

Key responsibilities:

- Load and cache the layout catalog.
- Download `layout.html` and page catalogs.
- Parse layout shell HTML into `Layout`.
- Parse page HTML into `Template` or `Article` content.

### Import flow

`ImportLayoutHandler`:

- Rejects duplicate imports by `CommunityLayoutId`.
- Imports the community layout shell.
- Allocates a new `LayoutNumber`.
- Makes the imported layout default only if no default layout already exists.
- Imports associated community templates into the same layout family.

### Imported template preparation

`LayoutVersioningService.ImportCommunityTemplatesAsync()`:

- Converts imported pages into `Template` rows.
- Runs `IArticleHtmlService.EnsureEditableMarkers()` on template content.
- Associates imported templates with both `LayoutId` and `LayoutNumber`.

## Preview and Editor Support

`LayoutTemplateService` currently provides preview templates used by the editor when previewing layouts.

Current behavior:

- Returns a small list of preview templates.
- Loads preview HTML from embedded resources first.
- Falls back to the filesystem under `Templates/`.

`HomeController` uses this service to build a preview article model for layout previews.

## Persistence and Querying

`ApplicationDbContext` defines indexes that matter for layout operations:

- `Layout.LayoutNumber`
- `Layout.LayoutNumber + Version`
- `Layout.LayoutNumber + IsDefault + Published`
- `Template.LayoutNumber`
- `Template.LayoutNumber + LayoutId`

These support:

- Layout family lookups
- Latest-version resolution
- Default published layout selection
- Template resolution by family or pinned version

`LayoutQueryExtensions` also adds common query helpers for:

- Family filtering
- Latest-version selection
- Published/draft filtering
- Ordered family/version queries

## Rendered Shell Contract

For debugging and template/rendering pipeline work, keep the effective layout shell contract in mind:

- Layout head content is merged into page-level `head` markup.
- Layout header content renders before template/article body content.
- Layout footer content renders after template/article body content.

The effective render shape is:

1. document and `head` scaffold,
2. layout header,
3. template/article body content,
4. layout footer.

This contract is useful when diagnosing issues that appear only after publish.

## Marker and Section Safety

Layout editing workflows rely on identifiable section boundaries for header/footer composition.

When editing or transforming imported layout HTML, preserve section boundary conventions and avoid removing markers required by visual tooling flows.

In practice:

- avoid rewriting header/footer sentinel sections blindly,
- keep transformation logic idempotent across repeated saves,
- verify builder/code mode round-trips preserve section integrity.

## Operational Notes For Dev Support

When supporting site builders in production incidents, check these quickly:

- published/default status for the target layout family,
- template association mode (`LayoutNumber` family vs `LayoutId` pin),
- imported asset/reference availability,
- preview vs published differences caused by stale assets or mismatched layout version.

## Developer Guidelines

When changing layout behavior:

- Treat `LayoutNumber` as the stable family key.
- Avoid mutating the currently published default layout in place.
- Prefer versioned edits for default layouts.
- Be explicit about whether templates should track a layout family or pin to a specific version.
- Preserve unmigrated-data compatibility where `LayoutNumber == 0` still exists.
- Keep preview-template changes aligned with editor preview expectations.

## When To Read The Site-Builder Guide

Use the site-builder guide when you need the conceptual intent behind a layout:

- what belongs in a layout versus a template,
- naming and CSS conventions,
- handoff expectations,
- responsive and accessibility validation.

Use this developer guide when you need the implementation details:

- versioning,
- data relationships,
- controller/handler entry points,
- import and preview flows,
- runtime resolution rules.
