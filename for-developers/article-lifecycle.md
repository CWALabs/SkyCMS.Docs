<!-- Audience: Backend Developers and Architects -->
<!-- Type: Explanation + How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Editor/Features/Articles/Create/CreateArticleHandler.cs, SkyCMS/Editor/Features/Articles/Save/SaveArticleHandler.cs, SkyCMS/Editor/Features/Articles/Delete/DeleteArticleHandler.cs, SkyCMS/Editor/Services/Publishing/PublishingService.cs, SkyCMS/Editor/Features/Blogs/CreatePost/CreateBlogPostCommandHandler.cs, SkyCMS/Editor/Features/Blogs/UpdatePost/UpdateBlogPostCommandHandler.cs, SkyCMS/Editor/Features/Blogs/UpdateStream/UpdateBlogStreamHandler.cs, SkyCMS/Editor/Features/Blogs/DeletePost/DeleteBlogPostCommandHandler.cs, SkyCMS/Editor/Features/Blogs/DeleteStream/DeleteBlogStreamHandler.cs, SkyCMS/Editor/Features/Articles/Trash/TrashArticleHandler.cs -->

# Article Lifecycle (General, BlogPost, BlogStream)

## When to use this page

Use this guide when you need to:

- understand article command/handler lifecycle behavior,
- trace publish/unpublish/delete effects on runtime artifacts,
- verify implementation expectations across article types.

## Related guides

- Editor guide: [Updating and Deleting Articles](../for-editors/updating-and-deleting-articles.md)
- Glossary: [../reference/glossary.md](../reference/glossary.md)

## What An Article Is

In SkyCMS, an [article](../reference/glossary.md#article) is the core content record the system uses to represent authored content.

An article is used for:

- Storing the editable source content for a page or post.
- Tracking title, URL path, publish state, [Article Number](../reference/glossary.md#article-number), and version history.
- Carrying metadata such as banner image, introduction, category, and blog key.
- Acting as the source object from which public output is generated when content is published.

In practice, an article is the draft-and-version source of truth. When an article is published, SkyCMS creates or updates the [Published Page](../reference/glossary.md#published-page) in `Pages` and optionally writes static output and supporting files such as TOC data.

## Purpose

This page documents what the system does when an article is created, updated, and deleted, including how those actions affect publishing artifacts.

Scope:

- ArticleType.General
- ArticleType.BlogPost
- ArticleType.BlogStream

## Lifecycle Model

At a high level, article lifecycle has two separate operations:

1. Create or save the Article record in Articles.
1. Publish or unpublish public output (Pages, static file output, TOC, CDN purge).

Creation can happen in draft mode (Published = null) or publish-now mode (Published has a value).

## Shared Creation Pipeline

Most creation paths eventually use CreateArticleCommand handled by CreateArticleHandler.

Key behavior during creation:

- Validates title and reserved-path conflicts.
- Determines first-article behavior.
- Chooses content source in this order:

  1) ContentOverride
  2) Template content
  3) Default lorem ipsum content

- Determines UrlPath in this order:

  1) UrlPathOverride
  2) root (first article only)
  3) Generated URL from title

- Determines Published in this order:

  1) Command.Published
  2) Auto publish if this is the first article
  3) null (draft)

- Writes Articles row and ArticleNumbers row.
- Upserts ArticleCatalog.
- If Published has value, triggers PublishAsync.

## What PublishAsync Does

When an article is published (from create, save, or explicit publish):

- Ensures Published is set.
- Unpublishes earlier versions of the same ArticleNumber.
- Removes prior PublishedPage rows for that ArticleNumber (except redirects).
- Writes fresh PublishedPage row to Pages.
- Generates static page output when static publishing is enabled.
- Regenerates TOC.
- Regenerates blog TOC when article type is BlogPost or BlogStream.
- Purges CDN for the page path.

## ArticleType.General

### Create as Draft

Expected behavior:

- Article row is created with ArticleType = General.
- Published = null.
- No public page is created in Pages.

Typical command shape:

- CreateArticleCommand with Published omitted or null.

### Create and Publish at the Same Time

Expected behavior:

- Article row is created with Published set.
- PublishAsync runs immediately.
- Public page is written to Pages and static output may be generated.

Typical command shape:

- CreateArticleCommand with Published = DateTimeOffset.UtcNow (or scheduled datetime).

### Special Case: First Article

If the site has no articles yet, first create auto-publishes and uses UrlPath = root unless explicitly overridden.

## ArticleType.BlogPost

Blog posts are typically created through CreateBlogPostCommandHandler, which delegates to CreateArticleCommand with ArticleType = BlogPost.

### Create as Draft (default UI behavior)

Expected behavior:

- Parent blog must exist.
- Blog post Article row is created with BlogKey and ArticleType = BlogPost.
- Published = null.
- No PublishedPage yet.

Typical command shape:

- CreateBlogPostCommand with Published = null.

### Create and Publish at the Same Time (Blog Post)

Expected behavior:

- Same creation pipeline as above.
- Because Published is provided, PublishAsync runs.
- PublishedPage is created with blog post rendering for direct access.
- Blog-specific TOC is refreshed.

Typical command shape:

- CreateBlogPostCommand with Published set.

## ArticleType.BlogStream

Blogs are usually created from BlogController.Create.

Current default behavior in that path:

- Uses CreateArticleCommand with ArticleType = BlogStream.
- Sets Published = UtcNow at create time.
- Result: stream is created and immediately published.

### Create as Draft (supported by command model)

If BlogStream is created through CreateArticleCommand without Published:

- Blog is created as draft.
- No published page until publish occurs.

### Create and Publish at the Same Time (Blog)

If Published is provided at create time:

- Blog is created and published immediately.
- Published page and TOC are updated.

## Publishing State Changes After Creation

### SaveArticleCommand behavior

For General and BlogPost edit/save paths using SaveArticleHandler:

- Published passed in command controls publish state.
- Published != null triggers publish workflow.
- Published = null keeps article unpublished.

### Blog update cascade behavior

For BlogStream updates using UpdateBlogHandler:

- If command.Published has value:
  - Blog is published.
  - Child BlogPost articles in same BlogKey are also published using same date.
- If command.Published is null:
  - Blog is unpublished.
  - Child BlogPost articles in same BlogKey are unpublished.

## What Happens When An Article Is Updated

Update behavior depends on the command path used.

### General updates (SaveArticleHandler)

When editing a general article through SaveArticleCommand:

- Loads the latest version for the ArticleNumber.
- Normalizes and validates content/metadata.
- Updates the current row and increments VersionNumber.
- If title changes, delegates to TitleChangeService to coordinate title/URL-path side effects.
- Upserts ArticleCatalog.
- If Published has a value, runs PublishAsync (rebuilds PublishedPage, static output as configured, TOC, and CDN purge).

### Blog post updates

There are two update paths currently in code:

- SaveArticleHandler path (editor save flow): same behavior as general updates.
- UpdateBlogPostCommandHandler path: creates a new Article row version (instead of in-place update), copies stable routing fields (UrlPath and BlogKey), and persists Published from the command.

### Blog updates (UpdateBlogHandler)

When editing a blog:

- Updates blog metadata (Title, UrlPath, BlogKey, description, hero image).
- If blog UrlPath changes, rewrites child BlogPost UrlPath values to keep `blog-slug/post-slug` format.
- If Published has a value, publishes the blog and all child posts with the same publish date.
- If Published is null, unpublishes the blog and all child posts.
- Regenerates blog wrapper content and processes title-change redirects.

## What Happens When An Article Is Unpublished

Unpublishing hides a published article from the public while retaining the article and its editable content.

### Unpublish behavior

When Published is set to null via SaveArticleCommand or UpdateBlogHandler:

- The article's Published timestamp is cleared.
- The PublishedPage entry for that ArticleNumber is removed (no longer accessible at its URL).
- The article remains in Articles table with all versions intact.
- All metadata, version history, and locks are preserved.
- The article can be republished later without data loss.

### Typical unpublish workflow

Editors typically unpublish when:

- Content needs to be temporarily hidden (seasonal, under review, maintenance).
- Older versions should be archived but remain editable.
- Content should be moved to another state without permanent deletion.

Unpublish is distinct from delete:

- **Unpublish** removes public visibility but keeps data and editability.
- **Delete** marks as deleted and removes PublishedPage; initiates final cleanup.

## What Happens When An Article Is Deleted

Delete behavior is a soft-delete of draft versions plus cleanup of public artifacts.

### General article delete (DeleteArticleHandler)

For DeleteArticleCommand:

- Finds all versions by ArticleNumber.
- Marks all versions with StatusCode = Deleted.
- Removes related PublishedPage rows for that ArticleNumber.
- Removes the ArticleCatalog entry.
- Deletes static page output when static publishing is enabled.
- Rewrites TOC after deletion.
- Blocks deletion of the `root` home page.

### Blog post delete (DeleteBlogPostCommandHandler)

For DeleteBlogPostCommand:

- Filters by ArticleNumber + BlogKey + BlogPost type.
- Marks all matching versions as Deleted.
- Does not physically remove rows.

### Blog delete (DeleteBlogHandler)

For DeleteBlogCommand:

- Locates the blog by Id and BlogKey.
- Finds all child post article numbers in the same blog.
- Deletes posts first, then deletes the blog (cascade behavior).
- Uses shared article deletion logic so blog and posts follow the normal article deletion cleanup path.

## What Happens When An Article Is Permanently Trashed

Trash is distinct from soft-delete: trash is permanent, irreversible removal from all system layers.

### Trash operation (TrashArticleHandler)

For TrashArticleCommand:

- Validates that the article is already deleted (soft-delete state required).
- Permanently removes all Article versions by ArticleNumber.
- Removes all PublishedPage rows for that ArticleNumber.
- Removes ArticleCatalog entries.
- Removes ArticleLock rows (any in-progress editing locks).
- Removes ArticleLog rows (audit/history records).
- Deletes the folder `/pub/articles/{ArticleNumber}` from storage (static artifacts).
- Rewrites TOC after removal.

### Typical workflow

Editor workflows typically follow this pattern:

1. Delete an article (soft-delete): marked as deleted, published artifacts cleaned up.
1. Later, empty or review the trash/deleted items.
1. Permanently trash the article (irreversible): all versions, metadata, and artifacts are removed.

## Practical Options for "Create + Publish"

Use one of these patterns:

1. General page: send `CreateArticleCommand` with `ArticleType = General` and `Published = now`.
1. Blog post: send `CreateBlogPostCommand` with `Published = now`.
1. Blog: keep current `BlogController.Create` behavior (already publish-now), or set `Published` explicitly when calling the handler directly.
1. Scheduled publication: set `Published` to a future `DateTimeOffset`; scheduler and publish logic activate on that timestamp.

## Verification Checklist

After create-and-publish, verify:

- Articles row exists with expected ArticleType and Published.
- Exactly one active published version per ArticleNumber.
- Pages has a PublishedPage row for that ArticleNumber.
- ArticleCatalog.Published is set.
- Blog and TOC files are regenerated for blog content.
- CDN purge result is recorded when CDN is configured.

## Code References

- Creation:
  - Editor/Features/Articles/Create/CreateArticleHandler.cs
  - Editor/Features/Blogs/CreatePost/CreateBlogPostCommandHandler.cs
- Save/update:
  - Editor/Features/Articles/Save/SaveArticleHandler.cs
  - Editor/Features/Blogs/UpdatePost/UpdateBlogPostCommandHandler.cs
  - Editor/Features/Blogs/UpdateStream/UpdateBlogStreamHandler.cs
- Delete:
  - Editor/Features/Articles/Delete/DeleteArticleHandler.cs
  - Editor/Features/Blogs/DeletePost/DeleteBlogPostCommandHandler.cs
  - Editor/Features/Blogs/DeleteStream/DeleteBlogStreamHandler.cs
- Trash:
  - Editor/Features/Articles/Trash/TrashArticleHandler.cs
- Publish pipeline:
  - Editor/Services/Publishing/PublishingService.cs
  - Editor/Data/Logic/ArticleEditLogic.cs
- Tests:
  - Tests/Editor/Features/Articles/Create/CreateArticleHandlerTests.cs
  - Tests/Integration/ArticleLifecycleIntegrationTests.cs
  - Tests/Features/Articles/Save/SaveArticlePublishingTests.cs
  - Tests/Features/Articles/Delete/DeleteArticleHandlerTests.cs
  - Tests/Features/Blogs/DeleteBlogStreamCommandTests.cs
  - Tests/Features/Blogs/UpdateBlogStreamCommandTests.cs

## Quick Code Map (Where to Look)

Use this as a starting map when debugging or extending lifecycle behavior.

### Controllers (entry points)

- Editor flows:
  - Editor/Controllers/EditorController.cs
  - Key actions: Create, CreateInitialHomePage, Save, PublishPage, UnpublishPage, Versions
- Blog flows:
  - Editor/Controllers/BlogController.cs
  - Key actions: Create (blog), Edit (blog), CreatePost (post), Posts

### Views (UI surfaces)

- Editor views:
  - Editor/Views/Editor/Create.cshtml
  - Editor/Views/Editor/Edit.cshtml
  - Editor/Views/Editor/Designer.cshtml
  - Editor/Views/Editor/EditCode.cshtml
  - Editor/Views/Editor/Versions.cshtml
  - Editor/Views/Editor/Publish.cshtml
  - Editor/Views/Editor/__NewHomePage.cshtml
- Blog views:
  - Editor/Views/Blog/Create.cshtml
  - Editor/Views/Blog/Edit.cshtml
  - Editor/Views/Blog/CreatePost.cshtml
  - Editor/Views/Blog/Posts.cshtml
- Rendered published page template:
  - Sky.Shared.Razor/Views/Home/Index.cshtml

### Commands and Handlers (CQRS lifecycle core)

- Article creation:
  - Editor/Features/Articles/Create/CreateArticleCommand.cs
  - Editor/Features/Articles/Create/CreateArticleHandler.cs
- Article save/update:
  - Editor/Features/Articles/Save/SaveArticleCommand.cs
  - Editor/Features/Articles/Save/SaveArticleHandler.cs
- Blog post creation:
  - Editor/Features/Blogs/CreatePost/CreateBlogPostCommand.cs
  - Editor/Features/Blogs/CreatePost/CreateBlogPostCommandHandler.cs
- Blog updates and publish cascade:
  - Editor/Features/Blogs/UpdateStream/UpdateBlogStreamCommand.cs
  - Editor/Features/Blogs/UpdateStream/UpdateBlogStreamHandler.cs
- Blog post update/versioning:
  - Editor/Features/Blogs/UpdatePost/UpdateBlogPostCommandHandler.cs

### Services and Logic (publish mechanics)

- Publish/unpublish implementation:
  - Editor/Services/Publishing/IPublishingService.cs
  - Editor/Services/Publishing/PublishingService.cs
- Editor orchestration helpers:
  - Editor/Data/Logic/ArticleEditLogic.cs
- Supporting services used by create/save:
  - Editor/Services/Titles/ITitleChangeService.cs
  - Editor/Services/Catalog/ICatalogService.cs
  - Editor/Services/Html/IArticleHtmlService.cs
  - Editor/Services/Slugs/ISlugService.cs

### Core Data Models

- Article type enum:
  - Common/ArticleType.cs
- Draft/version source of truth:
  - Common/Data/Article.cs
- Published projection:
  - Common/Data/PublishedPage.cs

### High-Value Tests

- End-to-end lifecycle:
  - Tests/Integration/ArticleLifecycleIntegrationTests.cs
- Create behavior (root/auto publish/overrides):
  - Tests/Editor/Features/Articles/Create/CreateArticleHandlerTests.cs
- Save + publish interactions:
  - Tests/Features/Articles/Save/SaveArticlePublishingTests.cs
- Blog publish/unpublish cascade:
  - Tests/Features/Blogs/UpdateBlogStreamCommandTests.cs
