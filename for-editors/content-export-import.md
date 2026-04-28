---
canonical_title: Content export and import
description: Export pages as HTML and import content programmatically via the Docs Import API for backup, migration, and CI/CD workflows.
doc_type: How-to
product_area: publishing
user_intent: export-pages-and-import-content-via-docs-import-api
audience:
  - Editors
  - Developers
  - Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Content export and import

## Summary

SkyCMS supports exporting pages as HTML files and importing content programmatically via the Docs Import API. These features enable backup, migration, and CI/CD-driven content workflows.

---

## Exporting pages

### HTML export

Export any page version as a standalone HTML file:

1. Open the page in the editor.
2. Click **Export** (or navigate to `/Editor/ExportPage?id={articleVersionId}`).
3. The browser downloads an HTML file.

**File naming:** `pageid-{ArticleNumber}-version-{VersionNumber}.html`

### Details

- Exports the rendered HTML content of the page, including the template.
- If no specific version ID is provided, a blank page is created and exported.
- Available to Administrators, Editors, Authors, and Team Members.
- The export uses the server-side view render service to produce the final HTML.

---

## Importing content

### Docs import API

SkyCMS provides a REST API for programmatically importing content. This is primarily used by the **DocsPublisher** tool for CI/CD documentation pipelines, but can be used by any integration.

**Endpoint:** `POST /_api/import/docs/items/{sourceKey}`

#### Authentication

The API uses key-based authentication:

| Configuration Key | Description |
| ----------------- | ----------- |
| `DocsImport:ApiKey` | API key for authenticating import requests |
| `DocsImport:UserId` | User ID to attribute imported content to |

Set these in `appsettings.json` or environment variables:

```json
{
  "DocsImport": {
    "ApiKey": "your-secret-api-key",
    "UserId": "user-guid"
  }
}
```

#### Request format

```json
{
  "SourceKey": "unique-document-identifier",
  "Title": "Page Title",
  "Content": "<p>HTML content...</p>",
  "UrlPath": "/docs/my-page",
  "Category": "Documentation",
  "Introduction": "Brief description of this page"
}
```

| Field | Required | Description |
| ----- | -------- | ----------- |
| **SourceKey** | Yes | Stable identifier for the document (e.g., file path). Used for upsert matching. |
| **Title** | Yes | Page title |
| **Content** | Yes | HTML body content |
| **UrlPath** | Yes | Target URL path for the page |
| **Category** | No | Content category for organization |
| **Introduction** | No | Brief description or excerpt |

#### Upsert behavior

- If a page with the given `SourceKey` already exists, the latest version is updated (or a new version is created).
- If no matching `SourceKey` is found, a new article is created.
- Embedded images and assets in the HTML are extracted and uploaded to blob storage automatically.

#### Rate limiting

The import endpoint is rate-limited:

| Environment | Limit |
| ----------- | ----- |
| Production | 3 requests / 5 minutes |
| Development | 20 requests / 1 minute |

**Request size limit:** 1 MB per request.

---

## DocsPublisher integration

The **SkyCMS.DocsPublisher** project provides a CLI/pipeline tool for bulk-importing documentation files into SkyCMS:

1. Point DocsPublisher at a directory of Markdown or HTML files.
2. It traverses the file tree and submits each file via the Docs Import API.
3. Each file's relative path becomes its `SourceKey` for upsert matching.
4. Subsequent runs update existing pages rather than creating duplicates.

See the [DocsPublisher Quick Start](https://github.com/CWALabs/SkyCMS.DocsPublisher/blob/main/QUICK_START.md) for setup instructions.

---

## Multi-tenancy

- Exported pages come from the current tenant's content.
- Imported pages are assigned to the current tenant via the database context filter.
- Asset uploads go to the tenant's blob storage container.
- The `UserId` from the import configuration is recorded in the audit trail.

---

## See also

- [Version History](version-history.md) — Imports create new article versions
- [Publishing Modes](publishing-modes.md) — Imported pages arrive as drafts; publish separately
- [Blog API Reference](../for-developers/api/blog-api.md) — JSON API for blog content
