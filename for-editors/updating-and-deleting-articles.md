<!-- Audience: Content Editors -->
<!-- Type: Explanation + How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Editor/Features/Articles/Save/SaveArticleHandler.cs, SkyCMS/Editor/Features/Articles/Delete/DeleteArticleHandler.cs, SkyCMS/Editor/Features/Blogs/UpdateStream/UpdateBlogStreamHandler.cs, SkyCMS/Editor/Features/Blogs/DeleteStream/DeleteBlogStreamHandler.cs -->

# Updating and Deleting Articles

## When to use this page

Use this guide when you need to:

- update published or draft content safely,
- unpublish/delete/trash articles correctly,
- verify expected outcomes after lifecycle actions.

## Related guides

- [Article Lifecycle Quick Reference](./article-lifecycle-reference.md) — State diagram and common workflows
- [Creating Articles](./creating-articles.md)
- [Scheduling Pages](./page-scheduling.md)
- Developer lifecycle details: [../for-developers/article-lifecycle.md](../for-developers/article-lifecycle.md)

## Publishing

Publishing makes your article visible on the live site. You can publish immediately or schedule it for a future date/time.

### Publish now

The article becomes live immediately.

### Schedule a publish

Set a future date and time; the article automatically publishes at that moment.

See also: [Scheduling Pages](./page-scheduling.md)

## What Happens When You Update An Article

When you update an article, SkyCMS saves your edits to the article record and keeps version history.

### If the article is a draft

Expected result:

- Your content and metadata changes are saved.
- The article remains unpublished.
- No live page update happens yet.

### If the article is published

Expected result:

- Your changes are saved.
- The published output is refreshed.
- The live page reflects the new content after publish processing completes.

### If you change the title

Expected result:

- The title is updated.
- URL/title-related routing and redirect behavior is applied by the system.
- Blogs can also update child post paths when the blog path changes.

### If you update a blog

Expected result:

- Blog metadata is updated.
- If blog URL path changes, child blog post URLs are updated to match the new blog path.
- Publish state changes can cascade to posts in that blog.

## What Happens When You Unpublish An Article

Unpublishing hides a published article from the live site while keeping the editable content.

### Unpublish action

Expected result:

- The article is hidden from the live site and public views.
- The article can no longer be accessed by visitors at its URL.
- You retain the ability to edit the article and re-publish it later.
- All version history and metadata are preserved.

### When to unpublish

Common scenarios:

- **Seasonal content** – Hide it when not relevant; re-publish next season.
- **Archived posts** – Hide outdated blog posts without losing history.
- **Temporary removal** – Hide during maintenance or updates; republish when ready.
- **Content review** – Take live content down pending revisions.

### Republish unpublished content

To bring an unpublished article back to live:

1. Open the unpublished article for editing.
2. Select **Publish** (immediately or schedule a date).
3. The article becomes visible on the live site again.

## What Happens When You Delete An Article

Deleting uses a soft-delete model and removes public artifacts for that article.

### General pages and articles

Expected result:

- The article is marked deleted in the editor data.
- Its published page entry is removed.
- Static output (if enabled) is removed.
- Site TOC/navigation data is regenerated.

### Blog post delete

Expected result:

- The selected blog post (all versions) is marked deleted.
- It is no longer treated as active content.

### Blog delete

Expected result:

- Posts in that blog are deleted first.
- The blog is then deleted.
- Blog and post content follow the same cleanup behavior as other article deletes.

### Home page protection

Important:

- The `root` home page cannot be deleted directly.
- Replace it first, then delete the old page if needed.

## What Happens When You Permanently Trash An Article

Trashing is different from deletion. Use it when you are certain an article should be irreversibly removed.

### Trash action

Expected result:

- All versions of the article are permanently removed from the database.
- All related metadata, locks, and audit logs are removed.
- Static storage artifacts are deleted.
- Site TOC is regenerated.
- This action cannot be undone.

### When to trash

Typical scenarios:

- The deleted article has been in the trash for a retention period and needs final cleanup.
- An article was created by mistake and should be completely erased from history.
- Storage or compliance retention policies require permanent removal.

## Editor Checklist

After update or delete, verify:

- The article appears in the expected draft/published state.
- The live URL renders the expected result (or returns not found after delete).
- Blog/post URLs still match expected structure after blog title/path changes.
