---
canonical_title: Compare Page Versions
description: Side-by-side comparison of two saved versions of a SkyCMS page to identify what changed between them.
doc_type: How-to
product_area: editor
user_intent: compare-two-versions-of-a-page
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

# Compare Page Versions

Use the **Compare** view to see a side-by-side diff of two saved versions of a page. This helps you identify what changed, who made the change, and whether you want to revert.

## Opening the Compare View

1. Go to the Pages Catalog and find the page.
2. Open the **More (...)** menu → **Version History**.
3. In the Version History list, select **two versions** using the checkboxes.
4. Click **Compare**.

The comparison screen opens with the older version on the left and the newer version on the right.

## Reading the Diff

- **Green** text or sections indicate additions.
- **Red** text or sections indicate deletions.
- **Unchanged** content is shown in neutral color.

The diff compares the rendered HTML content of each version. Structural tags, inline styles, and text content are all visible.

## Acting on the Comparison

After reviewing the diff, you can:

| Action | How |
| --- | --- |
| Keep the current version | Close the Compare view — no changes are made |
| Restore the older version | Click **Restore this version** below the left panel |
| Open a version for editing | Click **Edit** below either panel to open it in the editor |

## Notes

- The Compare view is read-only. You cannot edit content directly in this view.
- Restoring a version creates a new draft from that snapshot — it does not overwrite other versions.
- Only saved versions appear in the comparison list. Auto-save drafts that were never explicitly saved may not appear.

## Related Guides

- [Version History](version-history.md) — browse all saved versions and restore any snapshot
- [Trash and Recovery](trash-and-recovery.md) — recover a page that was deleted
- [Dashboard Overview](dashboard-overview.md) — find pages in the Pages Catalog
