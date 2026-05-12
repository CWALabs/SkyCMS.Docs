---
canonical_title: Trash and Recovery
description: Recover deleted pages from the SkyCMS trash, or permanently remove content you no longer need.
doc_type: How-to
product_area: editor
user_intent: recover-or-permanently-delete-trashed-pages
audience:
  - Content Editors
  - Content Managers
  - Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Trash and Recovery

When you delete a page in SkyCMS, it moves to the **Trash** rather than being permanently removed. You can restore it from there at any time, or permanently delete it when you are ready.

## How the Trash Works

Deleting a page sets its status to **Deleted**. The page is no longer visible on the live site or in the main Pages Catalog list, but it remains in the database. The Trash view shows all deleted pages for the current tenant.

## Opening the Trash

Go to **Editor → Trash** in the top navigation or sidebar. The list shows all deleted pages with their original title, URL slug, and the date they were deleted.

## Restoring a Deleted Page

1. Open the Trash.
2. Find the page you want to restore.
3. Click **Restore**.
4. The page status returns to **Draft** and it reappears in the Pages Catalog.

After restoring, the page is not yet live. Open it and publish it when ready.

## Permanently Deleting a Page

Permanent deletion cannot be undone.

1. Open the Trash.
2. Find the page you want to remove permanently.
3. Click **Delete Permanently**.
4. Confirm the deletion.

The page and its version history are removed from the system.

## Notes

- Restored pages retain all previous versions and their permissions settings.
- If a published page is deleted, it is immediately taken offline. Restoring it returns it to Draft status — it will not automatically go live again.
- Only users with the Content Manager or Administrator role can permanently delete pages.

## Related Guides

- [Version History](version-history.md) — browse and restore earlier content snapshots
- [Dashboard Overview](dashboard-overview.md) — the main Pages Catalog
- [Publishing a Page](publish-a-page.md) — republish a restored page
