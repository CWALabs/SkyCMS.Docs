---
canonical_title: Key Concepts
description: Canonical definitions for tenants, layouts, templates, articles, pages, blog streams, blog posts, published pages, widgets, and layers in SkyCMS.
audience:
  - All
doc_type: Explanation
status: Canonical
entities:
  - tenant
  - layout
  - template
  - article
  - page
  - published-page
  - blog-stream
  - blog-post
  - widget
  - layers-panel
keywords:
  - SkyCMS concepts
  - layouts templates articles
  - pages vs articles
  - blog streams
  - blog posts
  - layers panel
source: SkyCMS/Common/Data/Article.cs, SkyCMS/Common/Data/Layout.cs, SkyCMS/Common/Data/Template.cs
---

# Key Concepts

This page is the canonical vocabulary reference for SkyCMS documentation. When other pages use shorter, role-specific language, prefer the definitions here.

## Tenants and domains

A **tenant** is an isolated website or domain hosted by the same SkyCMS application instance.

- Each tenant has its own configuration, content, and publishing context.
- Runtime tenant resolution is based on the incoming request domain and related configuration.
- Documentation about layouts, templates, articles, and publishing assumes work is happening inside one tenant unless stated otherwise.

## Layouts

A **layout** is the site-wide shell wrapped around rendered content.

Layouts typically define:

- global header, footer, and navigation,
- theme styles, scripts, and shared assets,
- shared landmarks and body structure.

Layouts should own presentation shared across many pages. They should not own one-off article content.

## Templates

A **template** is a reusable content structure that runs inside a layout.

Templates typically define:

- repeatable page patterns,
- stable editable regions,
- presentation defaults for a page type.

Templates are recommended when multiple articles share the same structure. They are optional for one-off content.

## Articles

An **article** is the primary authored content record in SkyCMS.

An article may represent:

- a general content page,
- a blog post,
- a blog stream,
- a SPA deployment,
- another supported content type.

In the data model, the article is the source record that editors create, update, version, schedule, publish, unpublish, and delete.

## Pages and published pages

The word **page** is used in two different ways across SkyCMS docs and UI.

- In editor and site-builder language, a **page** usually means a general article that editors create and manage.
- In platform and data-model language, a **published page** is the public projection stored in the `Pages` table after an article is published.

Practical rule:

- When discussing authoring, creation, editing, templates, or workflow, think **article**.
- When discussing public output, routing, or published HTML, think **published page**.

## Blog streams and blog posts

A **blog stream** is an article with `ArticleType = BlogStream`. It acts as the parent container for a collection of blog posts grouped by `BlogKey`.

A **blog post** is an article with `ArticleType = BlogPost`. It belongs to a blog stream through the shared `BlogKey`.

Important distinction:

- Blog streams and blog posts are both article types.
- They use the same lifecycle fundamentals as other articles.
- Their public output is still represented through published pages when content is published.

## Widgets

A **widget** is a reusable component that can be inserted into templates, layouts, or visual compositions where supported.

Widgets are used for things like:

- navigation,
- forms,
- images,
- blog-related components,
- tables of contents,
- other reusable content blocks.

## Layers and the Layers panel

The term **layer** is overloaded in SkyCMS docs, so use it carefully.

- In **Page Builder**, the **Layers panel** means the visual hierarchy of nested elements on the canvas.
- In **architecture** discussions, a **layer** may mean the conceptual stack of layout, template, article, and published page.
- In **infrastructure** discussions, layer can also mean caching or delivery layers.

If you mean the editor feature, say **Layers panel** rather than just **layers**.

See [Layers Panel](../for-editors/layers.md) for the editor-specific guide.

## Editors and publisher

SkyCMS separates authoring from public delivery.

- The **Editor** is where users create, revise, schedule, and publish articles.
- The **Publisher** is the pipeline that turns authored content into public output, updates indexes, and clears caches when needed.

## How concepts fit together

The canonical runtime model is:

```text
Layout -> Template (optional) -> Article -> Published Page
```

Common paths:

1. **General article with template**: layout wraps template, template hosts editable regions, article fills those regions, publishing creates the public page.
2. **General article without template**: layout wraps article content directly, publishing creates the public page.
3. **Blog post**: layout and template rules still apply, but the article type and routing are blog-specific.

## Related guides

- [Layouts, Templates, and Articles](../for-developers/layouts-templates-articles.md)
- [Templates](../for-site-builders/templates.md)
- [Pages](../for-site-builders/pages.md)
- [Blogging](../for-editors/blogging.md)
- [Glossary](../reference/glossary.md)
