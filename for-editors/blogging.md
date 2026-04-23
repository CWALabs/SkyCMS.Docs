---
canonical_title: Blogging
description: Create and manage blogs and blog posts in SkyCMS using the standard article lifecycle and blog-specific rendering rules.
audience:
	- Content Editors
	- Authors
	- Administrators
doc_type: How-to
status: Draft
entities:
	- blog
	- blog-post
	- article
keywords:
	- blogs
	- blog posts
	- publish blog
source: SkyCMS/Editor/Features/Blogs/
---

# Blogging

SkyCMS includes a dedicated blogging subsystem with support for multiple independent blogs, post management, banner images, and public preview.

## Terminology note

- A **blog** is an article with `ArticleType = BlogStream` (the enum value is retained for compatibility).
- A **blog post** is an article with `ArticleType = BlogPost`.
- Both use the standard article lifecycle and publishing workflow.

---

## Quick Start

1. Navigate to **Editor → Blogs** from the sidebar.
2. Click **Create** to set up a new blog.
3. Give it a title, description, and optional banner image.
4. Open the blog and click **New Post** to write your first post.
5. Edit the post in the standard page editor, then **Publish** when ready.

---

## Blogs

A **blog** is a named collection of blog posts — similar to a blog category or publication channel. A single site can host multiple independent blogs (e.g., "Company News", "Engineering Blog", "Product Updates").

### Creating a Blog

1. Go to **Editor → Blogs**.
2. Click **Create**.
3. Fill in the fields:

| Field | Required | Description |
| ------- | ---------- | ------------- |
| **Title** | Yes | Display name shown on the blog index (max 128 characters) |
| **Blog Key** | Yes | URL-safe identifier, auto-generated from the title. Only lowercase letters, numbers, hyphens, and underscores are allowed (`^[a-z0-9-_]+$`). Must be unique. Max 64 characters. |
| **Description** | Yes | Summary text shown on the stream index page (max 512 characters) |
| **Banner Image** | No | Featured image for the stream. Click the image placeholder to upload or select from the File Manager. |
| **Publish Date** | No | Optional publication date/time. Leave blank to keep the stream in draft. |

1. Click **Create** to save.

### Editing a Blog

1. From the blog list, click **Edit** on the blog row.
2. Update any fields — title, description, banner image, or publish date.
3. Click **Save**.

> **Note:** Changing the title does not change the Blog Key. The key is permanent once created.

### Deleting a Blog

1. Click **Delete** on the blog row.
2. Review the confirmation page.
3. Click **Confirm Delete**.

> **Warning:** Deleting a blog also deletes all posts within it. This is a soft delete — the content is marked as deleted but may be recoverable by an administrator.

### Default Blog

One blog can be designated as the site default. Use the **Make Default** action in the blog list to promote a blog. The default blog is used as the reassignment target for orphaned posts.

---

## Blog Posts

Blog posts are articles that belong to a blog. They use the same editing tools as standard pages (Page Editor, Code Editor, Page Builder) but are organized and rendered through the blog infrastructure.

### Creating a Blog Post

1. Open the blog from **Editor → Blogs**.
2. Click **New Post**.
3. Enter a title in the modal dialog and click **Create**.
4. You are redirected to the page editor with an empty post. Write your content.
5. Optionally set a banner image, introduction text, and publish date.
6. Click **Publish** to make the post live, or save as a draft.

### Post Properties

| Property | Description |
| ---------- | ------------- |
| **Title** | Post headline (max 254 characters). The URL slug is auto-generated from the title. |
| **Content** | The post body, edited with any of the standard editors. |
| **Introduction** | Short excerpt or summary (max 512 characters). Shown in blog listings. |
| **Banner Image** | Featured image displayed at the top of the post and in listings. |
| **Published** | Set a date/time to make the post live. Leave blank for draft. |
| **Category** | Optional taxonomy label (max 64 characters). |

### Managing Posts

From the blog posts list, each post has these quick actions:

| Action | Description |
| -------- | ------------- |
| **Edit** | Open the post in the page editor |
| **Delete** | Soft-delete the post (with confirmation) |
| **Preview on Site** | View the post as visitors will see it |

### Post URLs

Blog post URLs follow this pattern:

```text
/{blog-key}/{post-slug}
```

For example, a post titled "Getting Started with SkyCMS" in the "engineering" blog would have the URL:

```text
/engineering/getting-started-with-skycms
```

---

## Blog Templates

SkyCMS uses dedicated templates for blogs: the **Blog** template and the **Blog Post** template. These templates use blog-specific CSS classes and editable regions.

### Blog Template

The blog template renders the blog index page with a list of posts. Key elements:

- Stream title and introduction text
- Banner image (optional)
- Paginated post listing with title, excerpt, date, and thumbnail
- Navigation controls (previous/next page)

### Blog Post Template

The post template renders individual blog posts. Key elements:

- Post title (h2)
- Publication date and author info
- Banner image
- Post body content
- Previous/Next post navigation links

### Editable Regions

Blog templates define these editable regions using `data-ccms-ceid` attributes:

| Region ID | Purpose |
| ----------- | --------- |
| `skycms-blog-post-content` | Main post body content |
| `skycms-blog-post-author` | Author information widget |
| `skycms-blog-post-bi` | Banner image widget |

### CSS Classes

Blog templates use a consistent CSS class naming convention for styling:

**Stream classes** (prefix `sky-blog-stream-`):
`sky-blog-stream-section`, `sky-blog-stream-container`, `sky-blog-stream-header`, `sky-blog-stream-h1`, `sky-blog-stream-intro`, `sky-blog-stream-row`, `sky-blog-stream-nav-container`, `sky-blog-stream-nav-pagination`, `sky-blog-stream-figure`, `sky-blog-stream-card-image`

**Post classes** (prefix `sky-blog-post-`):
`sky-blog-post-article`, `sky-blog-post-body`, `sky-blog-post-info`, `sky-blog-post-info-updated`, `sky-blog-post-title`, `sky-blog-post-content`, `sky-blog-post-image`

You can customize blog appearance by overriding these classes in your layout's stylesheet.

Legacy templates may still contain older class names or markup patterns, but new documentation and new template work should prefer the stable `skycms-blog-post-*` region identifiers and `sky-blog-post-*` CSS hooks documented here.

---

## Blog Preview

Each blog has an anonymous preview endpoint:

```text
/editor/blogs/{blog-key}/preview
```

This renders a simplified view of the blog without requiring authentication. Use it to share a preview link with stakeholders who don't have editor accounts.

---

## Blog Rendering

### Client-Side Architecture

Blogs use a client-side rendering pattern for performance:

1. The server generates a **wrapper HTML** containing the blog header, an empty post container, and an embedded JSON array of post metadata.
2. The browser loads `/js/blog-stream-loader.js` which reads the embedded JSON.
3. Posts are inserted into the `#post-list` container dynamically.
4. Pagination is handled client-side via the `#pagination` nav element.

### Post Display

Each post in the stream listing shows:

- Title (linked to the full post)
- Publication or last-updated date
- Introduction/excerpt text
- Banner image thumbnail (if available)

Posts are sorted by publication date (newest first), then by title.

### Post Navigation

When viewing an individual blog post, previous/next navigation links appear at the bottom of the page. Navigation order follows publication date.

---

## See Also

- [Page Editor](page-editor.md) — Editing blog post content
- [File Manager](file-manager.md) — Uploading banner images
- [Article Lifecycle Reference](article-lifecycle-reference.md) — Content states and publishing
- [Page Scheduling](page-scheduling.md) — Scheduling blog posts for future publication
- [Blog API Reference](../for-developers/api/blog-api.md) — JSON endpoints for blog data
- [Blog Architecture](../for-developers/blog-architecture.md) — Technical internals for developers
