<!-- Audience: Backend and Full-Stack Developers -->
<!-- Type: Explanation + How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Common/Data/Template.cs, SkyCMS/Common/Data/PageDesignVersion.cs, SkyCMS/Editor/Controllers/TemplatesController.cs, SkyCMS/Editor/Features/Templates/Create/CreatePageDesignVersionHandler.cs, SkyCMS/Editor/Features/Templates/GetEditable/GetEditablePageDesignVersionHandler.cs, SkyCMS/Editor/Features/Templates/Save/SavePageDesignVersionHandler.cs -->

# Templates

## When to use this page

Use this guide when you need to:

- implement template controller/command flows,
- reason about template version and publish mechanics,
- support template rollout behavior across existing articles.

## Related guides

- Template hierarchy: [./layouts-templates-articles.md](./layouts-templates-articles.md)
- Layout implementation: [./layouts.md](./layouts.md)
- Editable region implementation: [./website-launch/CreatingEditableAreas.md](./website-launch/CreatingEditableAreas.md)
- Site-builder template guide: [../for-site-builders/templates.md](../for-site-builders/templates.md)

## What Templates Are

A template is a reusable content structure for articles.

Templates are optional for article rendering, but they are highly useful when you have a series of articles that should share the same format.

Examples:

- Multiple announcement posts with identical hero and metadata structure
- Repeated campaign pages with consistent section order
- Blog/article formats that should stay visually and structurally uniform

In SkyCMS, templates work with layout families and can be applied to one article or many articles.

## Editable region contract

For template HTML, editable regions are the contract between template structure and article content preservation.

Treat these as implementation requirements:

- `data-ccms-ceid` values must be stable across template versions when you want existing content to survive updates.
- Nested editable regions are invalid and can be rejected by backend validation.
- `data-editor-config` controls editor profile behavior (`title`, `heading`, `simple`, `standard`, `advanced`, `image-widget`).

Use the full implementation guide for markup patterns and profile behavior details:

- [Creating Editable Areas](./website-launch/CreatingEditableAreas.md)

## Core Entities Developers Should Know

### Template

The `Template` entity stores baseline content structure and metadata.

Important fields:

- `Id`: template identity
- `Title`: display name
- `Description`: editor-facing guidance
- `Content`: HTML structure for article content
- `LayoutId` and `LayoutNumber`: template-to-layout binding
- `PageType`: template category/type

### PageDesignVersion

Template editing is versioned through `PageDesignVersion`.

Important behavior:

- Editable versions are draft (`Published == null`)
- New versions are created for safe iteration
- Save operations update the editable draft version
- Publish operations apply template updates to articles as draft article versions

## Code Editor Creation Flow

The standard developer-facing flow is through `TemplatesController`.

### 1. Create a template shell

Endpoint/action:

- `TemplatesController.Create()`

What it does:

- Creates a new `Template` row with starter title/description/content
- Assigns current layout context (`LayoutId`, `LayoutNumber`, `CommunityLayoutId`)
- Creates initial `PageDesignVersion` via `CreatePageDesignVersionCommand`
- Redirects to template code editor (`Templates/EditCode`)

Notes:

- Relational providers use a transaction for template + first version creation
- Cosmos path cannot guarantee atomic cross-partition transaction for these two records

### 2. Open the code editor

Endpoint/action:

- `TemplatesController.EditCode(Guid id)`

What it does:

- Resolves editable version via `GetEditablePageDesignVersionCommand`
- Creates a new editable draft version if none exists (`GetEditablePageDesignVersionHandler`)
- Loads template content into `TemplateCodeEditorViewModel`
- Ensures editable markers in content via `IArticleHtmlService.EnsureEditableMarkers`

### 3. Save template edits

Primary save paths:

- `TemplatesController.DesignerData(...)` for designer-originated saves
- `TemplatesController.Edit(...)` unified editor endpoint for template updates

Command path:

- `SavePageDesignVersionCommand` handled by `SavePageDesignVersionHandler`

What save updates:

- Title and description (when provided by flow)
- Content (processed with editable markers)
- Layout binding metadata (`LayoutId`, `CommunityLayoutId`, `PageType`)
- Modification timestamp

## Publishing Template Changes

Template publish is a two-step conceptual flow:

1. Publish editable template version (`PublishPageDesignVersionCommand`)
2. Apply template to affected articles (creates draft article versions)

Key outcome:

- Articles receive template updates as new draft article versions
- Editors/developers can review and publish article drafts individually

## Recommended Developer Workflow

1. Create template through `TemplatesController.Create()`.
2. Use `EditCode` for structural HTML updates.
3. Keep template HTML marker-safe (avoid breaking editable regions).
4. Use preview/impact endpoints before broad rollout.
5. Publish template changes and review generated article drafts.
6. Publish updated article drafts selectively.

## Common Pitfalls

- Treating templates as mandatory for all articles.
- Editing layout concerns in templates instead of layout shell.
- Skipping impact preview before applying template changes broadly.
- Assuming Cosmos and relational transaction behavior is identical.

## Cross-Team Boundary

Use site-builder docs for design intent and content-structure guidance:

- [../for-site-builders/templates.md](../for-site-builders/templates.md)

Use this developer doc for implementation details:

- controller and command flow,
- version mechanics,
- code-editor save behavior,
- rollout and publish sequencing.
