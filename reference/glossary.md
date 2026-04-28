---
canonical_title: Glossary
description: Definitions for core SkyCMS terms used throughout the documentation.
doc_type: Reference
product_area: platform
user_intent: look-up-skycms-terminology
audience:
  - Developers
  - Editors
  - Site Builders
  - Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Glossary

This glossary defines core SkyCMS terms used throughout the documentation.

## Audience Guides

Use these role-based entry points for task-specific documentation:

- Editors: [../for-editors/index.md](../for-editors/index.md)
- Site builders: [../for-site-builders/index.md](../for-site-builders/index.md)
- Developers: [../for-developers/index.md](../for-developers/index.md)

## Article

The primary authored content record in SkyCMS. An article is the source object stored in `Articles` and may represent a general page, a blog post, a blog (listing page), or other supported content type.

See also:

- Editors: [../for-editors/creating-articles.md](../for-editors/creating-articles.md)
- Developers: [../for-developers/article-lifecycle.md](../for-developers/article-lifecycle.md)

## Article Catalog

The `ArticleCatalog` database table and its query services act as a lightweight metadata index across all articles in a tenant. Unlike the `Articles` table, it does **not** store body HTML. Its purpose is fast listing and search in the editor UI.

A row in `ArticleCatalog` (a `CatalogEntry`) holds: `ArticleNumber` (the article's identity key), `Title`, `Introduction` (teaser), `BannerImage`, `UrlPath`, `Status`, `Updated`, `Published`, `TemplateId`, `AuthorInfo`, `ArticlePermissions`, and `RowVersion`.

The catalog is written alongside the article on every create and save operation. The editor uses it for every article-list view so that full article bodies never need to be loaded for browsing or search.

## Article Number

The logical identifier shared across all versions of the same article. Multiple versions can exist for one article number, but only one version should be publicly published at a time.

## Article Type

The classification of an article. It controls behavior, rendering expectations, and sometimes routing or publishing behavior. Current documented types include `General`, `BlogPost`, and `BlogStream`.

## Blog Key

The grouping key used to associate a blog with its blog posts. For blog content, this is the value used to connect posts to their parent blog and to generate blog-specific output such as TOC content.

## Blog Post

An article with `ArticleType = BlogPost`. A blog post belongs to a blog through its `BlogKey`, can be created as a draft or published immediately, and renders as an individual published page.

## Blog

An article with `ArticleType = BlogStream` (the enum value is retained for compatibility). A blog acts as the parent container for blog posts in a given `BlogKey` and can be saved as draft, published immediately, or scheduled like other articles.

## Catalog Entry

The persisted row in `ArticleCatalog` for a single article. A catalog entry is the lightweight summary the editor uses for article lists, previews, and search — it does **not** contain the article body HTML.

Key fields: `ArticleNumber` (PK, immutable), `Title`, `Introduction`, `BannerImage`, `UrlPath`, `Status`, `Updated`, `Published`, `TemplateId`, `AuthorInfo`, `ArticlePermissions`, `RowVersion` (optimistic concurrency token).

## CDN Purge

The cache invalidation step performed after publishing when a CDN is configured. Its purpose is to remove stale cached responses so newly published content becomes visible immediately.

## Content Override

Optional content supplied during article creation that takes precedence over template content. If present, it is used instead of the template body.

## Draft

An article version that has no `Published` timestamp. Draft content exists in `Articles` but does not yet exist as a public `PublishedPage`.

## Editor

The authoring application and user-facing administrative interface used to create, edit, manage, schedule, and publish content.

See also:

- Editor docs: [../for-editors/index.md](../for-editors/index.md)

## Expires

The optional UTC timestamp (`Article.Expires` / `PublishedPage.Expires`) at which a published piece of content should be treated as unavailable. When set, the scheduler or rendering logic suppresses the content after this date. A `null` value means the content has no planned expiry.

## First Article

The first article created in a site. In the shared creation pipeline, the first article has special behavior: it is auto-published by default and usually receives the URL path `root` unless explicitly overridden.

## General Article

An article with `ArticleType = General`. This is the default page-like content type used when no blog-specific or specialized behavior is required.

## Layout

The site-wide structural wrapper applied to rendered content. Layouts typically define shared page chrome such as header, footer, and navigation.

See also:

- Site-builder layouts guide: [../for-site-builders/layouts.md](../for-site-builders/layouts.md)
- Developer layouts guide: [../for-developers/layouts.md](../for-developers/layouts.md)

## Layers Panel

The Page Builder tree view used to inspect, select, and reorder nested elements on the current canvas. This is an editor feature and should not be confused with architectural layers such as layout, template, article, and published page.

## Page

In common usage, a page usually refers to a general article and its public result. In precise platform terms, the authored source is an **article** and the public projection is a **PublishedPage** stored in `Pages`.

## Published Page

The public-facing content snapshot stored in the `Pages` database table. A `PublishedPage` is created (or recreated) every time an article is published via `PublishAsync`.

What it contains:

- The article's `UrlPath`, `Title`, `ArticleNumber`, and `VersionNumber`.
- The rendered body `Content` — for `BlogPost` articles this is full HTML rendered with the site layout; for other types it is the raw article content.
- Metadata: `BannerImage`, `Introduction`, `Category`, `BlogKey`, `AuthorInfo`.
- Timing: `Published`, `Expires`, `Updated`.
- Per-page scripts: `HeaderJavaScript`, `FooterJavaScript`.

Lifecycle:

- Created when an article is published.
- Destroyed and replaced on each subsequent publish of the same article number (redirect entries are preserved).
- Removed when the article is unpublished.

The public-facing site reads `PublishedPage` directly for rendering — it does not read from the source `Articles` table.

## Published Timestamp

The UTC date and time stored in `Article.Published` that determines whether an article version is published, scheduled for future publication, or unpublished.

## Publisher

The publishing side of the system responsible for making content available publicly. In practical terms this includes the publish pipeline, public page generation, static output generation, and related cache invalidation.

## Publishing

The act of making an article version publicly accessible. `IPublishingService.PublishAsync` performs these steps in order:

1. Sets `Article.Published` to the current UTC time if it is null.
2. Clears the `Published` timestamp on earlier versions of the same article number (unpublishes them in `Articles`).
3. Removes all existing `PublishedPage` rows for that article number from `Pages` (redirect entries are preserved).
4. Creates a new `PublishedPage` row. For `BlogPost` articles the content is rendered with the site layout at this point; for other types the raw article content is stored directly.
5. Optionally writes a static HTML file to blob storage (when `StaticWebPages` is enabled).
6. Updates the site-wide TOC JSON at `/` and, for blog content, the blog-scoped TOC at `/{blogKey}`.
7. Purges the CDN cache for the affected URL paths.

The reverse operation is **Unpublish**.

## Root

The special URL path used for the home page. In article storage, the first home page often uses `UrlPath = root`.

## Save

The operation that updates an existing article version in the editor workflow. Depending on the `Published` value, a save can either keep the article as draft, maintain published state, or trigger publish behavior.

## Scheduler

The background process or scheduled workflow that activates content based on publish time and version rules. It is responsible for honoring future publish dates.

## Slug

The normalized, URL-safe form of a title or path segment. Slugs are used to build `UrlPath` values.

## SPA App

An article with `ArticleType = SpaApp`. Represents a deployed compiled single-page application rather than authored HTML content. Deployment metadata (keys, webhook secrets) is stored as JSON in `Article.Content`. The publisher configures fallback routing so that all sub-paths serve the SPA's `index.html` for client-side navigation.

## Static Publishing

The generation of static HTML artifacts during publishing. When enabled, publishing writes public output not only to the database projection but also to storage for static delivery.

## Status Code

The integer field (`Article.StatusCode` / `PublishedPage.StatusCode`) that records the lifecycle state of a record. Values come from `StatusCodeEnum`:

| Value | Name | Meaning |
| ------- | ------ | --------- |
| 0 | `Active` | Live and displayable when a `Published` timestamp is present. |
| 1 | `Inactive` | Hidden from the public; accessible to logged-in users only. |
| 2 | `Deleted` | Soft-deleted; not accessible to anyone until the status changes. |
| 3 | `Redirect` | The record represents a URL redirect. Redirect `PublishedPage` rows are preserved through publish and unpublish operations. |

## Table Of Contents (TOC)

The generated navigation or listing data written during publishing. TOC output is refreshed for the site in general and also for blog-specific paths when blog content is published.

## Template

The reusable content structure applied when creating a new article. Templates provide starting markup and define the page-level content shape used by layouts and editors.

See also:

- Site-builder templates guide: [../for-site-builders/templates.md](../for-site-builders/templates.md)
- Developer hierarchy guide: [../for-developers/layouts-templates-articles.md](../for-developers/layouts-templates-articles.md)

## Site Builder

A role focused on page composition and presentation systems. Site builders define and maintain layouts, templates, and reusable design conventions used by editors.

See also:

- Site-builder docs: [../for-site-builders/index.md](../for-site-builders/index.md)

## Developer

A role focused on platform behavior, architecture, integrations, and reliability. Developers implement and maintain lifecycle logic, rendering behavior, middleware, and related services.

See also:

- Developer docs: [../for-developers/index.md](../for-developers/index.md)

## Tenant

A logically isolated website or domain served by the same application instance. In multi-tenant deployments, a tenant’s configuration is resolved per request.

## Title Change Service

The service responsible for handling consequences of article title changes, such as URL changes, validation, and redirect-related behavior.

## URL Path

The relative path used to locate an article publicly. It is stored on the article and copied to published output when content is published.

## Unpublish

The reverse of **Publishing**. `IPublishingService.UnpublishAsync` removes all `PublishedPage` rows for an article number from `Pages` (redirect entries are preserved) and clears the `Published` timestamp on all versions of the article in `Articles`. The source content remains in `Articles` as a draft and can be republished at any time.

## Version

One saved state of an article. Versions are distinguished by `VersionNumber` and share the same `ArticleNumber`.

## Version Number

The incrementing number that identifies which saved revision of an article is being viewed or published. A higher version number indicates a newer revision of the same article.
