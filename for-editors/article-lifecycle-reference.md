<!-- Audience: Content Editors -->
<!-- Type: Reference -->
<!-- Status: Draft -->

# Article Lifecycle Quick Reference

## When to use this page

Use this reference when you need to:

- confirm article states and transitions,
- choose the right operation for publish/unpublish/delete/trash,
- verify expected behavior during common editorial workflows.

## State Diagram

```text
┌─────────────────────────────────────────────────────────────────┐
│                      ARTICLE LIFECYCLE                          │
└─────────────────────────────────────────────────────────────────┘

CREATE
  │
  ├─ Draft (Published = empty)
  │    │
  │    ├───→ Publish ──────────→ Published (live)
  │    │                           │
  │    │                           ├─→ Update ────→ (published version updates)
  │    │                           │
  │    │                           ├─→ Unpublish ──→ Draft (hidden from live)
  │    │                           │
  │    │                           └─→ Delete ─────→ Deleted (soft-delete)
  │    │
  │    ├─→ Update ────→ (draft version updates)
  │    │
  │    └─→ Delete ────→ Deleted (soft-delete, unpublished)
  │
  └─ Published (Published = now/future)
       │ (lifecycle continues as above)
       └─ See Published branch above

DELETED (Soft-Delete State)
  │
  └─→ Trash ────→ Permanently Removed (irreversible)
```

## Quick State Reference

- **Draft**: Content saved, not scheduled. User sees editable content. Public sees nothing.
- **Published**: Content scheduled or live now. User sees version history and can edit a new version. Public sees live page.
- **Unpublished**: Published content hidden (soft-unpublish). User sees editable content. Public sees nothing.
- **Deleted**: Soft-deleted and recoverable. User sees it outside active lists. Public sees nothing.
- **Trashed**: Permanently removed and unrecoverable. Public sees nothing.

## Operations by State

### From **Draft**

- **Publish** → Becomes Published
- **Update** → Saves new draft version
- **Delete** → Moves to Deleted
- **Unpublish** → *(N/A – already unpublished)*

### From **Published**

- **Update** → Saves new version; current published remains live until republish
- **Unpublish** → Moves to Unpublished (hidden from public; editable)
- **Delete** → Moves to Deleted; removes from public immediately
- **Publish** → *(N/A – already published)*

### From **Unpublished**

- **Publish** → Becomes Published again (with current version)
- **Update** → Saves new version while remaining unpublished
- **Delete** → Moves to Deleted
- **Unpublish** → *(N/A – already unpublished)*

### From **Deleted** (Soft-Delete)

- **Trash** → Permanently removed (point of no return)
- *(Recover via admin restore if available)*

### From **Trashed**

- *(No operations – data is gone)*

## Common Workflows

### Content Creation & Publication

1. Create article (as **Draft**)
2. Edit and save updates (stays **Draft**)
3. Preview in page editor
4. **Publish** → **Published** (goes live now or at scheduled time)

### Content Revision (Published)

1. Article is **Published** (live)
2. Edit content (creates new draft version)
3. Review changes
4. Republish → replaces public version

### Retire Content

1. Article is **Published** (live)
2. **Unpublish** → **Unpublished** (hidden; data retained)
3. Later, **Delete** → **Deleted** (soft-delete; in trash)
4. After retention period, **Trash** → Permanently removed

### Accidental Create / Wrong Content

1. Article is **Draft** (never published)
2. **Delete** → **Deleted** (soft-delete; recoverable)
3. **Trash** → Permanently removed (if certain)

## Key Distinctions

- **Unpublish**: Hides from public and keeps content editable. Reversible by republish.
- **Delete**: Soft-deletes content into trash. Reversible if restore is supported.
- **Trash**: Permanent removal. Not reversible.

## Related guides

- [Creating Articles](./creating-articles.md)
- [Updating Articles](./updating-and-deleting-articles.md#what-happens-when-you-update-an-article)
- [Unpublishing Articles](./updating-and-deleting-articles.md#what-happens-when-you-unpublish-an-article)
- [Deleting Articles](./updating-and-deleting-articles.md#what-happens-when-you-delete-an-article)
- [Trashing Articles](./updating-and-deleting-articles.md#what-happens-when-you-permanently-trash-an-article)
- [Scheduling Pages](./page-scheduling.md)
