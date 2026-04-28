---
canonical_title: Blog Architecture
description: Developer reference for the SkyCMS blogging subsystem, including article types, CQRS flows, rendering, routing, and published output behavior.
doc_type: Explanation
product_area: architecture
user_intent: understand-blog-architecture
audience:
  - Developers
difficulty: advanced
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Blog Architecture

## Summary

Developer reference for the SkyCMS blogging subsystem, including article types, CQRS flows, rendering, routing, and published output behavior.

## Canonical terminology

- Blogs and blog posts are both **article** types.
- Their public output is delivered through **published pages**.

---

## Overview

The blogging subsystem reuses the core `Article` entity and content pipeline but adds blog-specific organization, rendering, and URL routing. Blogs group posts by a shared `BlogKey`, and a dedicated rendering service generates client-side-rendered blog pages.

---

## Entity Model

Blogs do not have their own database table. Both blogs and blog posts are stored as `Article` records, distinguished by the `ArticleType` field:

| ArticleType | Value | Description |
| ------------- | ------- | ------------- |
| General | `0` | Standard content page |
| BlogPost | `1` | Individual blog post |
| BlogStream | `2` | Blog definition — listing page and parent container (enum value retained for compatibility) |
| SpaApp | `3` | Single Page Application |

### Key Fields for Blogging

| Field | Usage |
| ------- | ------- |
| `BlogKey` | Groups posts with their parent stream. Pattern: `^[a-z0-9-_]+$`. Default: `"default"`. |
| `ArticleType` | Discriminator: `1` for posts, `2` for streams. |
| `Introduction` | Post excerpt/summary (max 512 chars). |
| `BannerImage` | Featured image URL. |
| `Category` | Taxonomy label (max 64 chars). |
| `Content` | For streams: the generated wrapper HTML. For posts: the authored HTML body. |

---

## CQRS Architecture

Blog features follow the vertical-slice CQRS pattern used throughout SkyCMS.

### Commands

| Command | Handler Location | Purpose |
| --------- | ----------------- | --------- |
| `CreateBlogPostCommand` | `Editor/Features/Blogs/CreatePost/` | Create a new post in a blog |
| `UpdateBlogPostCommand` | `Editor/Features/Blogs/UpdatePost/` | Update post content/metadata |
| `UpdateBlogCommand` | `Editor/Features/Blogs/UpdateBlog/` | Update blog metadata, regenerate wrapper |
| `DeleteBlogCommand` | `Editor/Features/Blogs/DeleteBlog/` | Soft-delete blog + cascade to posts |
| `DeleteBlogPostCommand` | `Editor/Features/Blogs/DeletePost/` | Soft-delete individual post |

### Queries

| Query | Handler Location | Purpose |
| ------- | ----------------- | --------- |
| `GetBlogQuery` | `Common/Features/Blogs/Queries/` | Fetch blog metadata + latest post + count |
| `GetBlogPostQuery` | `Common/Features/Blogs/Queries/` | Fetch post content with prev/next navigation |
| `GetBlogPostNavigationQuery` | `Common/Features/Blogs/Queries/` | Fetch previous/next post links for a post |

### Command Flow Example: Creating a Post

```text
BlogController.CreatePost(blogKey, title)
  → Validate parent blog exists
  → CreateBlogPostCommand { BlogKey, Title, UserId, Published=null }
    → CreateBlogPostCommandHandler
      → Delegates to CreateArticleCommand (reuses core article pipeline)
      → Sets ArticleType = BlogPost, BlogKey = parent key
      → Returns { Id, ArticleNumber, UrlPath }
  → Redirect to editor for the new article
```

### Command Flow: Updating a Stream

```text
BlogController.Edit(id, model)
  → UpdateBlogCommand { Id, Title, Description, HeroImage, Published }
    → UpdateBlogHandler
      → Validates title uniqueness
      → Updates article fields
      → Calls BlogStreamRenderingService.GenerateBlogStreamWrapperAsync()
      → Saves regenerated wrapper HTML to Article.Content
```

---

## Rendering Service

**Interface:** `IBlogStreamRenderingService` (in `Common/Services/BlogPublishing/`)

**Implementation:** `BlogStreamRenderingService`

### Methods

| Method | Purpose |
| -------- | --------- |
| `GenerateBlogStreamWrapperAsync(article, blogKey)` | Generates the blog stream index page HTML with embedded post metadata JSON |
| `GenerateBlogPostMetadataJsonAsync(blogKey)` | Generates a JSON array of all published posts for a stream |
| `GenerateBlogPostSnippetAsync(article)` | Generates a single post as an HTML snippet |

### Client-Side Rendering Pattern

Blog pages use a client-side rendering approach:

```text
Server generates:
┌─────────────────────────────────────┐
│ Stream header (title, description)  │
│ <script type="application/json">    │
│   [ { post metadata array } ]       │
│ </script>                            │
│ <div id="post-list"></div>           │  ← Empty, filled by JS
│ <ul id="pagination"></ul>            │  ← Populated by JS
│ <script src="blog-stream-loader.js">│
└─────────────────────────────────────┘

Client-side:
1. blog-stream-loader.js reads embedded JSON
2. Renders post cards into #post-list
3. Builds pagination into #pagination
4. Post detail links navigate to /{blogKey}/{postSlug}
```

### CSS Class Convention

All blog CSS classes follow a BEM-like naming convention:

- **Stream elements:** `sky-blog-stream-{element}` (e.g., `sky-blog-stream-header`, `sky-blog-stream-row`)
- **Post elements:** `sky-blog-post-{element}` (e.g., `sky-blog-post-title`, `sky-blog-post-content`)
- **Navigation:** `sky-blog-stream-nav-{element}` (e.g., `sky-blog-stream-nav-item`, `sky-blog-stream-nav-link`)

---

## Controller

**File:** `Editor/Controllers/BlogController.cs`

**Route base:** `/editor/blogs`

**Authorization:** `[Authorize]` on the controller (all actions) except `PreviewStream` which is `[AllowAnonymous]`.

### Action Summary

| Action | HTTP | Route | Notes |
| -------- | ------ | ------- | ------- |
| `Index` | GET | `/editor/blogs` | Lists all blogs |
| `Create` | GET/POST | `/editor/blogs/create` | Create blog form + handler |
| `Edit` | GET/POST | `/editor/blogs/{id:guid}/edit` | Edit blog form + handler |
| `Delete` | GET | `/editor/blogs/{id:guid}/delete` | Delete confirmation |
| `ConfirmDelete` | POST | `/editor/blogs/{id:guid}/confirmdelete` | Execute delete |
| `Posts` | GET | `/editor/blogs/{blogKey}/posts` | Lists posts in blog |
| `Entries` | GET | `/editor/blogs/{blogKey}/entries` | Legacy alias for Posts |
| `CreatePost` | POST | `/editor/blogs/{blogKey}/posts/create` | Creates post |
| `CreateEntry` | POST | `/editor/blogs/{blogKey}/entries/create` | Legacy alias for CreatePost |
| `DeletePost` | GET | `/editor/blogs/{blogKey}/posts/{articleNumber:int}/delete` | Post delete confirmation |
| `DeleteEntry` | GET | `/editor/blogs/{blogKey}/entries/{articleNumber:int}/delete` | Legacy alias for DeletePost |
| `ConfirmDeletePost` | POST | `/editor/blogs/{blogKey}/posts/{articleNumber:int}/confirmdelete` | Execute post delete |
| `ConfirmDeleteEntry` | POST | `/editor/blogs/{blogKey}/entries/{articleNumber:int}/confirmdeleteentry` | Legacy alias for ConfirmDeletePost |
| `PreviewStream` | GET | `/editor/blogs/{blogKey}/preview` | Anonymous preview |
| `GetBlogs` | GET | `/editor/blogs/GetBlogs` | JSON: all blogs |
| `GetPosts` | GET | `/editor/blogs/{blogKey}/getposts` | JSON: posts in blog |
| `GetEntries` | GET | `/editor/blogs/{blogKey}/getentries` | Legacy alias for GetPosts |

> **Design note:** `CreatePost` and the legacy `CreateEntry` alias use `[HttpPost]` and receive the post title via a form field.

---

## Cosmos DB Compatibility

Blog queries follow the project-wide Cosmos DB compatibility rules:

- No cross-container joins between blogs and posts — queries are sequential with client-side correlation.
- Enum-to-int conversions (e.g., `ArticleType.BlogStream`) are pre-computed into local variables before LINQ predicates.
- The `GetBlogs` action fetches all blog-type articles, then groups by `ArticleNumber` client-side to get latest versions.

---

## Validation Rules

| Rule | Constraint |
| ------ | ----------- |
| BlogKey format | `^[a-z0-9-_]+$` |
| BlogKey uniqueness | Enforced — conflicts return validation error |
| BlogKey max length | 64 characters (validation), 128 characters (storage) |
| Stream title | Required, max 128 characters |
| Post title | Required, max 254 characters |
| Description | Required for streams, max 512 characters |
| URL path | Auto-generated via slug service, max 1999 characters |
| Published | Nullable — `null` = draft, value = published |

---

## See Also

- [Blogging Guide (Editors)](../for-editors/blogging.md) — Editor-facing guide
- [Blog API Reference](api/blog-api.md) — JSON endpoints
- [Architecture](architecture.md) — Overall application architecture
- [Article Lifecycle](article-lifecycle.md) — Article states and transitions
