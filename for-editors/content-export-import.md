# Content Export & Import

SkyCMS supports exporting pages as HTML files and importing content programmatically via the Docs Import API. These features enable backup, migration, and CI/CD-driven content workflows.

**Audience:** Editors, Developers, Administrators

---

## Exporting Pages

### HTML Export

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

## Importing Content

### Docs Import API

SkyCMS provides a REST API for programmatically importing content. This is primarily used by the **DocsPublisher** tool for CI/CD documentation pipelines, but can be used by any integration.

**Endpoint:** `POST /_api/import/docs/items/{sourceKey}`

#### Authentication

The API uses key-based authentication:

| Configuration Key | Description |
|-------------------|-------------|
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

#### Request Format

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
|-------|----------|-------------|
| **SourceKey** | Yes | Stable identifier for the document (e.g., file path). Used for upsert matching. |
| **Title** | Yes | Page title |
| **Content** | Yes | HTML body content |
| **UrlPath** | Yes | Target URL path for the page |
| **Category** | No | Content category for organization |
| **Introduction** | No | Brief description or excerpt |

#### Upsert Behavior

- If a page with the given `SourceKey` already exists, the latest version is updated (or a new version is created).
- If no matching `SourceKey` is found, a new article is created.
- Embedded images and assets in the HTML are extracted and uploaded to blob storage automatically.

#### Rate Limiting

The import endpoint is rate-limited:

| Environment | Limit |
|-------------|-------|
| Production | 3 requests / 5 minutes |
| Development | 20 requests / 1 minute |

**Request size limit:** 1 MB per request.

---

## DocsPublisher Integration

The **SkyCMS.DocsPublisher** project provides a CLI/pipeline tool for bulk-importing documentation files into SkyCMS:

1. Point DocsPublisher at a directory of Markdown or HTML files.
2. It traverses the file tree and submits each file via the Docs Import API.
3. Each file's relative path becomes its `SourceKey` for upsert matching.
4. Subsequent runs update existing pages rather than creating duplicates.

See the [DocsPublisher Quick Start](../../DocsPublisher/QUICK_START.md) for setup instructions.

---

## Multi-Tenancy

- Exported pages come from the current tenant's content.
- Imported pages are assigned to the current tenant via the database context filter.
- Asset uploads go to the tenant's blob storage container.
- The `UserId` from the import configuration is recorded in the audit trail.

---

## See Also

- [Version History](version-history.md) — Imports create new article versions
- [Publishing Modes](publishing-modes.md) — Imported pages arrive as drafts; publish separately
- [Blog API Reference](../for-developers/api/blog-api.md) — JSON API for blog content
