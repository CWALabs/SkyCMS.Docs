---
canonical_title: Creating Articles
description: Create general articles, blog posts, and blogs in SkyCMS and choose the correct initial publish state.
doc_type: How-to
product_area: editing
user_intent: create-articles-pages-and-blogs
audience:
  - Content Editors
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Creating Articles

## Summary

Use this guide to create new articles, pages, blog posts, and blogs in SkyCMS and choose the right initial publish state.

## Outcome

After completing this guide, you should be able to create the right content type, choose the appropriate initial publish state, and prepare for review, scheduling, or updates.

## When to use this page

Use this guide when you need to:

- create new general pages or blog posts,
- choose the right initial publish state,
- hand off cleanly into update and publish workflows.

## Before you start

- You have editor access to SkyCMS.
- For blog posts, the parent blog already exists.
- You understand the difference between draft and published content (see [Article Lifecycle Quick Reference](./article-lifecycle-reference.md)).

## Terminology note

SkyCMS uses the words **article** and **page** differently depending on context.

- In editor workflows, a general article is often called a **page**.
- In the data model, the **article** is the authored source record.
- After publishing, the public output is represented as a **published page**.

See [Key Concepts](../getting-started/key-concepts.md) for the canonical definitions.

## Template-backed pages and editable regions

When an article is based on a template, what you can edit is controlled by the template's editable regions.

- If an expected section is not editable, the template may not define that region as editable.
- If content disappears after a template update, region identifiers may have changed.

For technical details, share these references with your site builder/developer team:

- [Template editable regions (site-builder guide)](../for-site-builders/templates.md#editable-region-attribute-reference)
- [Creating Editable Areas (developer implementation guide)](../for-developers/website-launch/CreatingEditableAreas.md)

## Create a General Page

General pages are `ArticleType = General` articles that appear as site pages after publication.

### Steps

1. In the editor, select **Create** > **Page**.
2. Enter a **title** for the page.
3. Choose whether to start as **draft** or **publish now**.
   - **Draft**: Save your work as you edit; publish later when ready.
   - **Publish now**: Content becomes live immediately (or at a scheduled time).
4. Enter your **content** using the Visual Editor or Code Editor.
5. Add optional metadata:
   - Banner image
   - Introduction/summary text
   - Category
6. Click **Save**.

### What happens

- If you chose **draft**: The article is saved but not visible on the live site.
- If you chose **publish now**: The article is immediately made visible (or scheduled for a future date).

See also: [Scheduling pages](./page-scheduling.md)

## Create a Blog Post

Blog posts are child articles within a blog.

### Prerequisites

- The parent blog must exist.

### Steps for blog posts

1. From the blog page, select **New Post**.
2. Enter a **title** for the post.
3. Choose whether to start as **draft** or **publish now**.
4. Enter your **post content**.
5. Add optional metadata (banner image, introduction, category).
6. Click **Save**.

### What happens for blog posts

- The post is created within the parent blog.
- If draft: Not visible on the live site until published.
- If publish now: Made live immediately (or scheduled).

## Create a Blog

A blog is an article with `ArticleType = BlogStream` that organizes related blog posts.

### Steps for creating a blog

1. In the editor, select **Create** > **Blog**.
2. Enter a **title** for the blog (e.g., "News & Updates").
3. Enter a **description** (appears on the blog listing page).
4. Choose the initial publish state.
   - Leave **Publish Date** empty to keep the blog as a draft.
   - Set **Publish Date** to publish immediately or schedule publication.
5. Click **Save**.

### What happens for a blog

- A blog article is created.
- The blog URL is derived from the title.
- If no publish date is set, the blog remains draft until published.
- Blog posts can now be added to this blog.

## Initial publish state best practices

### Use draft when

- **Content is incomplete** – Save your work and continue editing.
- **Awaiting review** – Let others preview before going live.
- **Scheduled for future** – Prepare content in advance and publish later.

### Use publish now when

- **Content is final** – Ready for live visibility.
- **Scheduled publish** – Plan a specific date/time for go-live.
- **Blogs** – Often published soon after creation so the blog has a live landing page.

## Next steps

After creating an article, you can:

- **Update content** – See [Updating Articles](./updating-and-deleting-articles.md#what-happens-when-you-update-an-article).
- **Schedule publication** – See [Scheduling Pages](./page-scheduling.md).
- **Preview changes** - Use the Visual Editor preview mode.
- **Delete** – See [Deleting Articles](./updating-and-deleting-articles.md#what-happens-when-you-delete-an-article).

## Related guides

- [Updating and Deleting Articles](./updating-and-deleting-articles.md)
- [Article Lifecycle Quick Reference](./article-lifecycle-reference.md)
- [Scheduling Pages](./page-scheduling.md)
- [Template editable regions (site-builder guide)](../for-site-builders/templates.md#editable-region-attribute-reference)
