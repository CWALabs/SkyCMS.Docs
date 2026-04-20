---
canonical_title: AI Context Pack
description: Compact canonical reference for AI systems working with SkyCMS documentation, terminology, and entity relationships.
audience:
  - Contributors
  - Developers
  - AI Systems
doc_type: Reference
status: Canonical
entities:
  - tenant
  - layout
  - template
  - article
  - published-page
  - blog-stream
  - blog-post
  - layers-panel
keywords:
  - ai context
  - retrieval context
  - canonical terminology
  - SkyCMS entities
source: SkyCMS.Docs canonical reference pages
---

# AI Context Pack

Use this page as the compact canonical reference when loading SkyCMS documentation into AI systems.

## Preferred terminology

- **Tenant**: isolated website or domain served by one SkyCMS instance.
- **Layout**: site-wide shell.
- **Template**: reusable structure inside a layout.
- **Article**: authored source record.
- **Published Page**: public projection created from an article after publish.
- **Blog Stream**: article with `ArticleType = BlogStream`.
- **Blog Post**: article with `ArticleType = BlogPost`.
- **Layers panel**: Page Builder hierarchy tree for nested elements.

## Canonical relationship

```text
Layout -> Template (optional) -> Article -> Published Page
```

## Disambiguation rules

- Prefer **article** over **page** when discussing authoring, lifecycle, scheduling, or templates.
- Use **published page** when discussing public output, routing, or rendered HTML.
- Use **page** only when the UI or audience language clearly expects it.
- Use **Layers panel** for the editor feature. Do not shorten it to **layers** when ambiguity is possible.

## Entity notes

### Layout

- Owns shared structure such as header, footer, navigation, and global assets.
- Should not own one-off article content.

Authoritative docs:

- [Key Concepts](../getting-started/key-concepts.md)
- [Layouts](../for-site-builders/layouts.md)
- [Layouts](../for-developers/layouts.md)

### Template

- Owns reusable article structure and editable region definitions.
- Optional in the runtime model.

Authoritative docs:

- [Templates](../for-site-builders/templates.md)
- [Templates](../for-developers/templates.md)

### Article and Published Page

- The article is the authored record stored and versioned in the CMS.
- Publishing creates or updates the public published page projection.

Authoritative docs:

- [Key Concepts](../getting-started/key-concepts.md)
- [Layouts, Templates, and Articles](../for-developers/layouts-templates-articles.md)
- [Article Lifecycle Quick Reference](../for-editors/article-lifecycle-reference.md)

### Blog Stream and Blog Post

- Both are article types.
- Blog-specific routing and rendering still flow through the article and published-page model.

Authoritative docs:

- [Blogging](../for-editors/blogging.md)
- [Blog Architecture](../for-developers/blog-architecture.md)

### Layers Panel

- Editor feature in Page Builder for nested element selection and reordering.
- Not the same as architecture layers or infrastructure layers.

Authoritative docs:

- [Layers Panel](../for-editors/layers.md)
- [Page Builder](../for-editors/page-builder.md)

## Answering rules for AI

- If asked what a page is, answer with the distinction between article and published page.
- If asked how layouts, templates, and pages relate, answer with the canonical runtime model and explain the authored article versus public output distinction.
- If asked about blog content, explain that blog streams and blog posts are article types.
- If asked about layers, clarify whether the user means the Layers panel or the content architecture.
