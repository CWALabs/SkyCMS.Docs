---
canonical_title: URL and Redirect Management
description: Manage URL paths, automatic and manual redirects, and reserved paths in SkyCMS.
doc_type: How-to
product_area: editing
user_intent: manage-urls-and-redirects
audience:
  - Content Editors
  - Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# URL and redirect management

## Summary

Use this guide when you need to:

- understand how SkyCMS generates URL paths from page titles,
- view, edit, or delete redirects,
- manage reserved paths that protect system-level URLs.

SkyCMS provides tools for managing URL paths, automatic redirects when page titles change, manual redirect creation, and reserved path protection.

## URL paths (slugs)

Every page has a URL path (slug) derived from its title and position in the site hierarchy. For example, a page titled "Getting Started" under "Documentation" might have the URL path `/documentation/getting-started`.

- URL paths are unique within a tenant.
- Changing a page's title updates its URL path.
- When a URL path changes, a redirect is automatically created from the old path to the new one.

## Redirects

Redirects ensure visitors and search engines find content that has moved. SkyCMS supports both automatic and manual redirects.

### Automatic redirects

When a page title changes, the system:

1. Detects the URL path change.
2. Creates a redirect from the old URL to the new URL.
3. Fires a `RedirectCreatedEvent` domain event.
4. Invalidates the redirect cache.

This happens transparently — editors don't need to manage redirects for title changes.

### Viewing redirects

1. Navigate to **Redirects** in the editor menu (or go to `/Editor/Redirects`).
2. A paginated list shows all redirects with their source and destination URLs.
3. Sort by column headers to find specific redirects.

### Editing a redirect

1. From the redirects list, click on a redirect entry.
2. Modify the **From URL** or **To URL** fields.
3. Save changes.

> **Validation:** The `[RedirectUrl]` attribute validates that redirect URLs are well-formed.

### Deleting a redirect

1. From the redirects list, find the redirect to remove.
2. Click **Delete** to permanently remove the redirect.

> **Note:** Deleting a redirect means visitors using the old URL will receive a 404 error. Only delete redirects when you are certain the old URL is no longer in use.

## Reserved paths

Reserved paths prevent content from being created at system-level URLs (e.g., `/admin`, `/api`, `/_api`). This protects application routes from being overwritten by content pages.

### Viewing reserved paths

Navigate to **Reserved Paths** (or go to `/Editor/ReservedPaths`) to see the list of protected URL paths. The list supports:

- Pagination
- Sorting
- Text filtering

### Managing reserved paths

Administrators can:

- **Add** a reserved path — specify the path and optional notes explaining why it's reserved.
- **Edit** an existing reserved path.
- **Remove** a reserved path (allowing content to use that URL).

Each reserved path entry includes:

| Field | Description |
| ----- | ----------- |
| **Path** | The protected URL path |
| **Notes** | Explanation of why this path is reserved |
| **CosmosRequired** | Whether this path requires Cosmos DB availability |

## How redirects are stored

Redirects are stored as Article records with a special status code (Redirect). The redirect's fields map as follows:

| Article Field | Redirect Usage |
| ------------- | -------------- |
| **UrlPath** | The source ("from") URL |
| **BannerImage** | The destination ("to") URL |
| **StatusCode** | Set to Redirect (4) |

This design means redirects participate in the same versioning, tenant isolation, and query infrastructure as regular content.

## Caching

Redirect lookups are cached in memory to avoid database queries on every request:

- Cache key: `ArticleRedirects`
- Automatically invalidated when a `RedirectCreatedEvent` fires.
- Optional cache duration configurable per query.

## Multi-tenancy

- Each tenant has its own set of redirects and reserved paths.
- URL uniqueness is enforced per tenant — the same URL path can exist in different tenants.
- Redirect queries are automatically filtered by the current tenant.

## See also

- [Version History](version-history.md) — Title changes that trigger automatic redirects
- [Publishing Modes](publishing-modes.md) — How redirects interact with publish/unpublish
- [Audit & Logging](../for-developers/audit-logging.md) — Domain events fired on redirect creation
