# Version History

SkyCMS tracks every save as a versioned snapshot, allowing editors to view the full history of any page, compare two versions side by side, and restore deleted content.

**Audience:** Editors, Authors, Administrators

---

## How Versioning Works

Every page in SkyCMS has two identifiers:

- **Article Number** — A stable, logical identifier that stays the same across all versions of a page.
- **Version Number** — An incrementing number for each saved snapshot of that page.

When you save a page, a new version is created automatically. The previous version is preserved and can be accessed from the version history.

### Version States

Each version has a status code that determines its lifecycle state:

| Status | Meaning |
|--------|---------|
| **Draft** | Work-in-progress, not visible to site visitors |
| **Review** | Submitted for editorial review |
| **Published** | Live on the site (or scheduled for a future date) |
| **Deleted** | Moved to trash — recoverable |
| **Redirect** | Special version used for URL redirects (see [URL Management](url-management.md)) |

---

## Viewing Version History

1. Open the page in the editor.
2. Navigate to **Versions** (or go to `/Editor/Versions/{articleNumber}`).
3. A paginated list of all versions appears, showing:
   - Version number
   - Last updated date
   - Published date (if applicable)
   - Expiration date (if set)

### Sorting

Click column headers to sort by:
- **Version Number** (default, newest first)
- **Published** date
- **Updated** date
- **Expires** date

---

## Comparing Versions

To compare two versions side by side:

1. From the version history list, select two versions.
2. Click **Compare** (navigates to `/Editor/Compare?leftId={id1}&rightId={id2}`).
3. The comparison view shows both versions with their content, allowing you to identify what changed.

---

## Creating a New Version

New versions are created automatically when you save. You can also explicitly create a version from a specific source:

- **From latest** — Creates a new version based on the most recent version.
- **From a specific version** — Copies content from a selected older version into a new draft.

This is useful when you want to branch from an earlier version rather than the current one.

---

## Restoring Deleted Pages

Pages moved to trash (status: Deleted) can be recovered:

1. Navigate to the trash or locate the deleted article.
2. Click **Restore** (or go to `/Editor/Restore/{articleNumber}`).
3. The page is restored to Draft status.

> **Note:** When a page is moved to trash, its published version is removed from the live site, and associated activity logs, article locks, and catalog entries are cleaned up. Restoring the page brings it back as a draft — you'll need to publish it again to make it live.

---

## Scheduled Publishing & Expiration

Versions support time-based lifecycle control:

- **Published date** — Set a future date/time to schedule publication. The page goes live automatically when the date arrives.
- **Expires date** — Set an expiration to automatically retire content. After the expiration date, the page is no longer served to visitors.

If no published date is set explicitly, the system assigns the current time (minus one second) to ensure immediate activation.

---

## Technical Details

### Storage Model

Versions are stored as full Article records in the database — each version is a complete snapshot, not a diff. This ensures any version can be restored independently without requiring the full version chain.

### Multi-Tenancy

Version history is automatically scoped to the current tenant. Each tenant sees only their own pages and version history.

---

## See Also

- [URL Management](url-management.md) — Redirects created automatically when page titles change
- [Publishing Modes](publishing-modes.md) — How publishing interacts with versioning
- [Content Export](content-export-import.md) — Exporting specific versions as HTML
