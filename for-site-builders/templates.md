<!-- Audience: Designers and Front-End Developers -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Templates/ -->

# Templates

## When to use this page

Use this guide when you need to:

- design or refine reusable page structures,
- define safe editable region patterns,
- roll out template changes to existing pages without content loss.

## Template responsibilities

Templates define reusable page-level structure inside a layout. They should provide consistent composition patterns for editors while staying flexible enough for real content.

Templates should own:

- repeated page structures (hero, body zones, sidebars, CTA regions),
- editable regions and widget slots,
- presentation defaults for a page type.

Templates should avoid owning:

- site-wide shell concerns (header/footer/global nav),
- one-off campaign content,
- implementation details that belong in layout-level assets.

## Create a template

Typical workflow:

1. Open Templates and create a new template.
2. Choose editing mode (Page Builder for visual composition, or Code Editor for explicit HTML control).
3. Build baseline structure for the target page type.
4. Define editable regions with stable identifiers.
5. Save and create a test page from the template.
6. Validate responsive behavior and editor usability.

Template patterns worth creating early:

- content/article page,
- blog post page,
- landing page,
- campaign page,
- information page with secondary navigation.

Use clear names and notes so editors can choose the right template quickly.

## Example implementations

These example templates show how common page types can be implemented across the same framework choices used in the layout examples.

- [Template Examples Overview](./template-examples/overview.md)
- [Generic Article Template Examples](./template-examples/generic-article.md)
- [Blog Post Template Examples](./template-examples/blog-post.md)
- [Landing Page Template Examples](./template-examples/landing-page.md)
- [Information Page with Secondary Navigation Examples](./template-examples/information-page-secondary-nav.md)

Use these examples to compare editable region strategy, semantic structure, and framework-specific markup choices before building your own production templates.

## Bind widgets and editable areas

Editable region rules are critical for safe template updates.

Use stable editable IDs (for example via `data-ccms-ceid`) and avoid renaming them unless migration is intentional.

Guidelines:

- Keep editable regions unique and non-nested.
- Use meaningful region naming (`title`, `summary`, `body`, `cta`).
- Reserve title-style regions for heading fields and rich regions for full content blocks.
- Keep widget-compatible containers explicit and documented.

When updating templates used by existing pages:

- unchanged editable IDs preserve content,
- removed or renamed editable IDs can orphan content,
- new editable IDs start empty on existing pages.

Safe rollout strategy:

1. Update one representative page first.
2. Validate content preservation.
3. Perform broader updates only after verification.

### Editable region attribute reference

| Attribute | Purpose |
| --- | --- |
| `data-ccms-ceid="region-id"` | Stable region identifier. Required for content preservation on template updates. Use meaningful names (`title`, `body`, `cta`). |
| `data-ccms-new="true"` | Auto-generates a GUID on first save. Use this during template authoring when you have not yet assigned a stable ID. |
| `data-editor-config="title"` | Minimal toolbar — plain heading text only. Use on `<h1>`–`<h6>` elements. |
| `data-editor-config="heading"` | Alias for `title`. Minimal toolbar. |
| `data-editor-config="simple"` | Compact toolbar — basic formatting and links. Good for short or structured text blocks. |
| `data-editor-config="standard"` | Standard toolbar — the default when the attribute is omitted. Balanced selection for general content. |
| `data-editor-config="advanced"` | Full toolbar — images, media, tables, lists, code blocks, and more. Also aliased as `default`, `richtext`, or `ckeditor`. |
| `data-editor-config="image-widget"` | FilePond-based image uploader widget. The first image widget in a template typically acts as the page banner by convention. |
| `class="ck-content"` | Applies CKEditor styles to the region. Required on all non-title rich content areas. |

Supported editable elements: block containers (`<div>`, `<section>`, `<article>`, `<aside>`, `<main>`, `<header>`, `<footer>`) and headings (`<h1>`–`<h6>`). Nested editable regions are not allowed — the backend will reject them.

Example editable region patterns:

```html
<!-- Rich content area (full toolbar) -->
<div data-ccms-ceid="hero-body" class="ck-content">
  Placeholder body content.
</div>

<!-- Title/heading (minimal toolbar) -->
<h1 data-ccms-ceid="hero-title" data-editor-config="title">Page Title</h1>

<!-- Image widget — ID is auto-assigned on first save -->
<div data-editor-config="image-widget" data-ccms-new="true" class="ck-content"></div>
```

## Testing template behavior

Before rollout, validate:

- template renders correctly inside the target layout,
- editable regions are discoverable and practical for editors,
- responsive behavior across mobile/tablet/desktop,
- links, media, and widgets remain stable,
- update behavior preserves existing page content.

Recommended verification sequence:

1. Create a fresh page from template.
2. Edit with Page Editor and save/publish cycle.
3. Update template and re-apply to one existing page.
4. Confirm preserved content and expected structural changes.
5. Proceed to wider update only if checks pass.

## Manage template pages

### Permissions

Template management requires the **Administrator** or **Editor** role.

### View pages using a template

In the template list, click **Pages** next to a template. The list shows:

- article number and title,
- last published date and current status (Published / Draft),
- last updated date,
- access restrictions (if per-page authentication is enabled).

From the page list you can: open version history for a page, clone a page (create a duplicate), unpublish a page (admins and editors), or update a single page to the latest template.

### Update a single page

1. In the template's page list, click the update icon next to the target page.
2. The page updates and opens in the visual editor for review.

What happens:

- Template structure is applied to the page.
- Content in editable regions with matching IDs is preserved.
- Non-editable template content is replaced by the updated template structure.
- New editable regions start empty on the updated page.

### Update all pages

> **Warning:** This applies to every page using the template and cannot be undone. Content in regions that were renamed or removed will be permanently lost. Always update one representative page and verify the result first.

1. In the template's page list, click **Update all pages**.
2. Read and confirm the warning dialog.
3. Wait for the process to complete — this may take several minutes for large page sets.

## Operational best practices

- Keep a small, well-curated template library.
- Prefer incremental template evolution over wholesale rewrites.
- Document intended usage and constraints in template notes.
- Coordinate with editors before high-impact template updates.

## Troubleshooting

Common issues and checks:

- Template missing in page creation: ensure template is saved and associated with active layout context.
- Page Editor not enabling as expected: verify editable region markup and non-nested structure.
- Content loss after update: check whether editable IDs were changed or removed.
- Save failure: validate markup and inspect console/server logs.

## Related guides

- [Layouts](./layouts.md)
- [Template Examples Overview](./template-examples/overview.md)
- [Pages](./pages.md)
- [Style Guide Template](./style-guide-template.md)
- [Creating Editable Areas (developer implementation guide)](../for-developers/website-launch/CreatingEditableAreas.md)
- [Developer hierarchy guide](../for-developers/layouts-templates-articles.md)
