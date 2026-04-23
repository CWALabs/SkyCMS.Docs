# Blogging

SkyCMS includes a dedicated blogging subsystem with support for multiple independent blog streams, post management, banner images, and rendering via dedicated blog templates.

**Audiences:** Editors, Authors, Administrators

**Jump to:**

- [Blog Streams](#1-blog-streams)
- [Blog Posts](#2-blog-posts)
- [Blog Templates](#3-blog-templates)
- [Blog Rendering](#4-blog-rendering)
- [Blog API](#5-blog-api)
- [Blog Data Architecture](#6-blog-data-architecture)

---

## 1. Blog Streams

 > **Documentation:** [Blogging Guide (Editors)](../../for-editors/blogging.md#blogs)

A blog stream is a named collection of blog posts — similar to a blog category or publication channel. Sites can host multiple independent blog streams.

### Stream Management

- Create new blog streams with title and description
- Edit stream title, description, and banner image
- Delete blog streams (with confirmation)
- List all blog streams in a paginated, sortable table
- Each stream has its own URL key for routing

### Stream Properties

| Property | Description |
| ---------- | ------------- |
| **Title** | Display name for the blog stream |
| **Description** | Summary text shown on the stream index |
| **Banner Image** | Optional featured image for the stream (visual upload) |
| **Publish Date** | Optional publication date/time with date picker. Leave blank to keep the stream as a draft. |
| **Blog Key** | URL-friendly identifier for routing |

---

## 2. Blog Posts

> **Documentation:** [Blogging Guide (Editors)](../../for-editors/blogging.md#blog-posts)

Blog posts are articles that belong to a blog stream. They use the same article editing pipeline (Page Editor, Code Editor, Page Builder) but are organized and rendered through the blog infrastructure.

### Post Management

- Create new posts within a stream (by title)
- Edit posts using the standard article editors
- Delete posts from a stream (with confirmation)
- List all posts in a stream with sortable, searchable table
- Paginated post listing

### Post Actions

Each blog post in the list provides quick actions:

- **Edit** — Open the post in the editor
- **Open** — View the published post
- **Set as Home** — Set the post as the stream's featured/home post
- **Clone** — Duplicate the post

---

## 3. Blog Templates

> **Documentation:** [Blogging Guide (Editors)](../../for-editors/blogging.md#blog-templates) · [Templates (Site Builders)](../../for-site-builders/templates.md) · [Blog Post Template Examples](../../for-site-builders/template-examples/blog-post.md)

SkyCMS provides dedicated blog-aware templates for consistent blog presentation.

### Template Types

- **Blog Post template** — Standard blog post layout with featured image, author info, and comment section
- **Blog Stream template** — Blog index/stream layout with post listing, featured image, and navigation

### Template Features

- Editable regions with stable blog-specific IDs (`skycms-blog-post-content`, `skycms-blog-post-author`, `skycms-blog-post-bi`)
- Styling hooks built around the `sky-blog-post-*` and `sky-blog-stream-*` CSS class conventions
- Live editor enabled for real-time editing
- Customizable styling via embedded `<style>` blocks
- Image widget with `data-ccms-enable-alt-editor` support
- Blog-aware `data-editor-config` attributes for toolbar control

---

## 4. Blog Rendering

> **Documentation:** [Blogging Guide (Editors)](../../for-editors/blogging.md#blog-rendering) · [Blog Architecture (Developers)](../../for-developers/blog-architecture.md#rendering-service)

### Stream View

- Paginated list of blog entries
- Each entry shows title, description, banner image, and publish date
- Sortable and filterable

### Post View

- Full article rendering within the blog post template
- Featured image display
- Author information section
- Styled content with blog-specific CSS (alternating row colors, blockquote styling, responsive table formatting)

### Preview

- Preview blog stream rendering before publishing
- Anonymous-accessible preview endpoint (`PreviewStream`)

---

## 5. Blog API

> **Documentation:** [Blog API Reference](../../for-developers/api/blog-api.md) · [API Overview](../../for-developers/api/overview.md)

JSON endpoints for programmatic access to blog data:

| Endpoint | Method | Description |
| ---------- | -------- | ------------- |
| `GetBlogs()` | GET | Returns JSON list of all blog streams |
| `GetEntries(blogKey)` | GET | Returns JSON list of posts in a stream |

---

## 6. Blog Data Architecture

> **Documentation:** [Blog Architecture (Developers)](../../for-developers/blog-architecture.md) · [Architecture (Developers)](../../for-developers/architecture.md)

### Blog Stream Entity

- Stream metadata (title, description, banner image URL)
- Collection of blog entries
- Independent from page/article hierarchy
- Dedicated CQRS commands and queries:
  - `CreateBlogStreamCommand` / `CreateBlogStreamHandler`
  - `UpdateBlogStreamCommand` / `UpdateBlogStreamHandler`
  - `DeleteBlogStreamCommand` / `DeleteBlogStreamHandler`
  - `GetBlogStreamQuery` / `GetBlogStreamHandler`

### Blog Post Entity

- Linked to parent blog stream via blog key
- Built on the article content model (full versioning, scheduling, permissions)
- CQRS handlers:
  - `CreateBlogPostCommand` / `CreateBlogPostHandler`
  - `UpdateBlogPostCommand` / `UpdateBlogPostHandler`
  - `DeleteBlogPostCommand` / `DeleteBlogPostHandler`

### Rendering Service

- `IBlogStreamRenderingService` — Handles blog stream and post HTML rendering
- Integrates with the layout/template system for consistent site presentation
