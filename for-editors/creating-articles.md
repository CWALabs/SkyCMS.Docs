<!-- Audience: Content Editors -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Editor/Features/Articles/Create/CreateArticleHandler.cs -->

# Creating Articles

This guide covers how to create new articles (pages or blog posts) and set their initial publish state.

## When to use this page

Use this guide when you need to:

- create new general pages or blog entries,
- choose the right initial publish state,
- hand off cleanly into update and publish workflows.

## Before You Start

- You have editor access to SkyCMS.
- For blog posts, the parent blog stream already exists.
- You understand the difference between draft and published content (see [Article Lifecycle Overview](./overview.md)).

## Template-backed pages and editable regions

When an article is based on a template, what you can edit is controlled by the template's editable regions.

- If an expected section is not editable, the template may not define that region as editable.
- If content disappears after a template update, region identifiers may have changed.

For technical details, share these references with your site builder/developer team:

- [Template editable regions (site-builder guide)](../for-site-builders/templates.md#editable-region-attribute-reference)
- [Creating Editable Areas (developer implementation guide)](../for-developers/website-launch/CreatingEditableAreas.md)

## Create a General Page

General pages are standalone articles that appear as site pages.

### Steps

1. In the editor, select **Create** > **Page**.
2. Enter a **title** for the page.
3. Choose whether to start as **draft** or **publish now**.
   - **Draft**: Save your work as you edit; publish later when ready.
   - **Publish now**: Content becomes live immediately (or at a scheduled time).
4. Enter your **content** using the page editor or code editor.
5. Add optional metadata:
   - Banner image
   - Introduction/summary text
   - Category
6. Click **Save**.

### What Happens

- If you chose **draft**: The article is saved but not visible on the live site.
- If you chose **publish now**: The article is immediately made visible (or scheduled for a future date).

See also: [Scheduling pages](./page-scheduling.md)

## Create a Blog Post

Blog posts are child articles within a blog stream.

### Prerequisites

- The parent blog stream must exist.

### Steps for Blog Posts

1. From the blog stream page, select **Create Entry** (or **New Post**).
2. Enter a **title** for the post.
3. Choose whether to start as **draft** or **publish now**.
4. Enter your **post content**.
5. Add optional metadata (banner image, introduction, category).
6. Click **Save**.

### What Happens for Blog Posts

- The post is created within the parent blog stream.
- If draft: Not visible on the live site until published.
- If publish now: Made live immediately (or scheduled).

## Create a Blog Stream

A blog stream is a container for organizing related blog posts.

### Steps for Blog Streams

1. In the editor, select **Create** > **Blog**.
2. Enter a **title** for the blog (e.g., "News & Updates").
3. Enter a **description** (appears on the blog listing page).
4. By default, the blog is **created and published immediately**.
   - To save as draft instead, adjust publish settings if available.
5. Click **Save**.

### What Happens for Blog Streams

- A blog stream (index) article is created.
- The blog URL is derived from the title.
- Blog posts can now be added to this stream.

## Initial Publish State Best Practices

### Use Draft When

- **Content is incomplete** – Save your work and continue editing.
- **Awaiting review** – Let others preview before going live.
- **Scheduled for future** – Prepare content in advance and publish later.

### Use Publish Now When

- **Content is final** – Ready for live visibility.
- **Scheduled publish** – Plan a specific date/time for go-live.
- **Blog streams** – Typically created live so posts can be added.

## What's Next

After creating an article, you can:

- **Update content** – See [Updating Articles](./updating-and-deleting-articles.md#what-happens-when-you-update-an-article).
- **Schedule publication** – See [Scheduling Pages](./page-scheduling.md).
- **Preview changes** - Use the page editor preview mode.
- **Delete** – See [Deleting Articles](./updating-and-deleting-articles.md#what-happens-when-you-delete-an-article).

## Related guides

- [Updating and Deleting Articles](./updating-and-deleting-articles.md)
- [Article Lifecycle Quick Reference](./article-lifecycle-reference.md)
- [Scheduling Pages](./page-scheduling.md)
- [Template editable regions (site-builder guide)](../for-site-builders/templates.md#editable-region-attribute-reference)
