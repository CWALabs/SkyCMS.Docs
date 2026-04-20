# Site Building

SkyCMS uses a three-layer authoring architecture — **Layouts → Templates → Articles** — with **Published Pages** as the public output. This separates site-wide structure from reusable content patterns and authored content while keeping the public delivery model explicit.

**Audiences:** Site Builders, Developers, Administrators

**Jump to:**

- [Content Architecture: Layouts, Templates, Articles](#1-content-architecture-layouts-templates-articles)
- [Layouts](#2-layouts)
- [Templates](#3-templates)
- [Pages](#4-pages)
- [Widgets](#5-widgets)
- [Style Guide Support](#6-style-guide-support)

---

## 1. Content Architecture: Layouts, Templates, Articles

> **Documentation:** [Layouts, Templates & Articles (Developers)](../../for-developers/layouts-templates-articles.md) · [Key Concepts](../../getting-started/key-concepts.md)

### Canonical Model

```text
┌─────────────────────────────────────────────┐
│  Layout (site-wide shell)                   │
│  ┌───────────────────────────────────────┐  │
│  │  Template (reusable page structure)   │  │
│  │  ┌─────────────────────────────────┐  │  │
│  │  │  Article (editor content)       │  │  │
│  │  └─────────────────────────────────┘  │  │
│  └───────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

Public output after publish: `PublishedPage`
```

| Layer | Managed By | Purpose |
| ------- | ----------- | --------- |
| **Layout** | Site Builder / Admin | Global header, footer, navigation, base styles, scripts |
| **Template** | Site Builder / Admin | Reusable page structures with defined editable regions |
| **Article** | Editor / Author | Authored content stored before publishing |

Terminology note: in editor and site-builder UI, a general article is often called a **page**. The canonical data-model terms are **article** and **published page**.

---

## 2. Layouts

> **Documentation:** [Layouts (Site Builders)](../../for-site-builders/layouts.md) · [Layout Examples Overview](../../for-site-builders/layout-examples/overview.md) · [No-Framework Layout Example](../../for-site-builders/layout-examples/no-framework.md) · [Bootstrap 5 Layout Example](../../for-site-builders/layout-examples/bootstrap-5.md) · [Tailwind CSS Layout Example](../../for-site-builders/layout-examples/tailwind.md) · [Bulma Layout Example](../../for-site-builders/layout-examples/bulma.md) · [Foundation Layout Example](../../for-site-builders/layout-examples/foundation.md) · [Layouts (Developers)](../../for-developers/layouts.md) · [Creating Layouts (Website Launch)](../../for-developers/website-launch/02-Creating-Layouts.md)

The **layout** is the outermost shell of every page — the consistent chrome that appears across the entire site (or a section of it).

### Layout Responsibilities

- Global site structure (header, footer, sidebar)
- Navigation menus
- Base spacing and typography
- Theme tokens and brand colors
- Site-wide scripts (analytics, chat widgets)
- Site-wide stylesheets

### Layout Editing

Two editing modes:

- **Page Builder** (GrapesJS) — Visual drag-and-drop design
- **Code Editor** (Monaco) — Direct HTML/CSS editing

### Layout Features

| Feature | Description |
| --------- | ------------- |
| **Create** | New layout from scratch |
| **Edit Code** | Direct HTML/CSS editing with Monaco |
| **Visual Designer** | GrapesJS drag-and-drop builder |
| **Edit Notes** | Attach metadata and documentation to a layout |
| **Preview** | Preview layout changes before publishing |
| **Publish** | Make a layout version the active default |
| **Promote** | Set a layout as the site-wide default |
| **Export** | Export layout as a downloadable file |
| **Import** | Import from the community layout library |
| **Delete** | Remove a layout (with confirmation) |

### Layout Versioning

- Published version is the active default shown to visitors
- Draft versions branch from the published version
- Promote a draft to become the new published version
- Only one published default layout active at a time

### Community Layout Library

- Browse and import pre-built layouts from the community gallery
- Paginated, sortable gallery view
- One-click import into your site

---

## 3. Templates

> **Documentation:** [Templates (Site Builders)](../../for-site-builders/templates.md) · [Template Examples Overview](../../for-site-builders/template-examples/overview.md) · [Generic Article Template Examples](../../for-site-builders/template-examples/generic-article.md) · [Blog Post Template Examples](../../for-site-builders/template-examples/blog-post.md) · [Landing Page Template Examples](../../for-site-builders/template-examples/landing-page.md) · [Information Page with Secondary Navigation Examples](../../for-site-builders/template-examples/information-page-secondary-nav.md) · [Templates (Developers)](../../for-developers/templates.md) · [Creating Templates (Website Launch)](../../for-developers/website-launch/03-Creating-Templates.md)

A **template** defines the reusable page structure within a layout. Templates contain **editable regions** where editors place content.

### Template Responsibilities

- Repeated page structure (content area, sidebar, feature sections)
- Define editable regions with specific toolbar profiles
- Presentation defaults (spacing, typography for the content area)
- Content slot definitions

### Template Editing

Two editing modes:

- **Page Builder** (GrapesJS) — Visual template composition
- **Code Editor** (Monaco) — Direct HTML editing with region markup

### Template Features

| Feature | Description |
| --------- | ------------- |
| **Create** | New template from scratch |
| **Edit Code** | HTML editing with editable region markup |
| **Visual Designer** | GrapesJS builder for template structure |
| **Pages** | View all pages using this template |
| **Update Page** | Apply template changes to a single page |
| **Publish** | Make template version active |
| **Publish Drafts** | Publish template and update all affected pages |
| **Preview Impact** | See which pages will be affected before publishing |
| **Delete** | Remove template (with confirmation) |

### Editable Region Markup

Templates use HTML attributes to define where editors can place content:

```html
<div data-ccms-ceid="main-content" 
     data-editor-config="standard" 
     class="ck-content">
  <!-- Editor content goes here -->
</div>
```

#### Region Attributes

| Attribute | Purpose |
| ----------- | --------- |
| `data-ccms-ceid="region-id"` | Stable identifier — persists across template updates |
| `data-ccms-new="true"` | Auto-generate a GUID on first save (for new regions) |
| `data-editor-config="profile"` | Toolbar mode: `title`, `simple`, `standard`, `advanced`, `image-widget` |
| `class="ck-content"` | Apply CKEditor styling to the region |
| `data-ccms-enable-alt-editor="true"` | Enable alt-text editing for image widget regions |

#### Supported Region Elements

- Block containers: `<div>`, `<section>`, `<article>`, `<aside>`, `<main>`, `<header>`, `<footer>`
- Headings: `<h1>` through `<h6>`
- **Nested editable regions are not allowed** — each region must be independent

### Content Preservation on Template Update

- When a template is updated, existing content in unchanged regions (same `data-ccms-ceid`) is preserved
- Only new regions appear empty; existing content is not overwritten
- Safe rollout strategy: test on one page first, then mass-update

### Template Patterns

Common template patterns provided or recommended:

- **Content / Article** — Standard article page with main content area
- **Landing Page** — Hero section, feature blocks, CTA sections
- **Campaign** — Time-limited promotional layouts
- **Information with Secondary Nav** — Content area with sidebar navigation

---

## 4. Pages

> **Documentation:** [Pages (Site Builders)](../../for-site-builders/pages.md) · [Article Examples Overview](../../for-site-builders/article-examples/overview.md) · [Standalone Content Article Examples](../../for-site-builders/article-examples/standalone-content.md) · [Announcement and Update Article Examples](../../for-site-builders/article-examples/announcement-update.md) · [Resource Article with Table of Contents Examples](../../for-site-builders/article-examples/resource-with-toc.md) · [Event Page Article Examples](../../for-site-builders/article-examples/event-page.md) · [Building the Home Page](../../for-developers/website-launch/04-Building-Home-Page.md) · [Building Initial Pages](../../for-developers/website-launch/05-Building-Initial-Pages.md)

In site-builder language, **pages** are the concrete content instances that editors create and publish. In the canonical model, those are authored as **articles** and delivered publicly as **published pages**. Each page inherits structure from its layout and template.

### Page Properties

- Title with URL slug auto-generation
- Title uniqueness validation
- Associated layout and template
- Editable content within template-defined regions
- Version history
- Permissions (per-page access control)
- Publication status and scheduling

### Page Types

- Standard content pages (`ArticleType = General`)
- Stand-alone articles rendered directly in a layout without a template
- Blog posts (managed through the blogging subsystem)
- Home page (special designation, created via initial setup or promoted)
- SPA (Single Page Application) deployments

---

## 5. Widgets

> **Documentation:** [Widgets Overview](../../for-site-builders/widgets/overview.md) · [Custom Widgets (Developers)](../../for-developers/extending/custom-widgets.md) · [Breadcrumbs](../../for-site-builders/widgets/breadcrumbs.md) · [Forms](../../for-site-builders/widgets/forms.md) · [Image Widget](../../for-site-builders/widgets/image.md) · [Nav Builder](../../for-site-builders/widgets/nav-builder.md) · [Search](../../for-site-builders/widgets/search.md) · [Table of Contents](../../for-site-builders/widgets/table-of-contents.md) · [Crypto Widget](../../for-site-builders/widgets/crypto.md)

Reusable components that editors can insert into pages through the Page Builder or template definitions.

### Available Widget Categories

Based on the GrapesJS block library integration:

- Blog components (stream, post)
- Contact forms and CTAs
- Content blocks (text, headings, lists)
- Commerce elements (pricing tables)
- Feature showcases
- Footer layouts
- Image galleries
- Header/navigation components
- Hero sections
- Statistics/data displays
- Step-by-step process displays
- Team member profiles
- Testimonial sections

### Widget Behavior

- Drag-and-drop placement in the Page Builder
- Configurable properties per widget instance
- Responsive behavior inherited from the design system
- Style customization via the Style Manager panel

---

## 6. Style Guide Support

> **Documentation:** [Style Guide Template](../../for-site-builders/style-guide-template.md)

SkyCMS provides a style guide template pattern for establishing and documenting site design standards.

### Style Guide Template

- Reference template for typography, colors, spacing, and component styling
- Serves as a living style reference for editors and site builders
- Helps maintain visual consistency across pages and editors
