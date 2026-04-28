---
canonical_title: Publishing progress
description: Real-time SignalR-based progress tracking for bulk publishing operations in SkyCMS.
doc_type: Reference
product_area: publishing
user_intent: monitor-bulk-publishing-progress
audience:
  - Editors
  - Administrators
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Publishing progress

## Summary

SkyCMS uses SignalR to provide real-time progress updates during bulk publishing operations. Editors and administrators see live feedback as pages are generated and deployed.

---

## How it works

When you trigger a bulk publish operation (e.g., regenerating static pages for the entire site or publishing a template change that affects multiple pages), the system:

1. Starts processing pages in parallel.
2. Sends real-time progress updates to your browser via SignalR.
3. Displays a progress indicator showing the current status.
4. Sends a completion notification when all pages are processed.

---

## Using bulk publish

### From the editor

1. Navigate to the publish interface.
2. Select the pages you want to regenerate, or leave the selection empty to process all published pages.
3. Click **Publish Static Pages**.
4. The progress indicator appears, showing:
   - Current page being processed
   - Completed count / total count
   - Status of each page (success or error)
5. A completion message appears when the operation finishes.

### Template publish cascade

When you publish a template (page design) version, the system automatically:

1. Updates all pages that use the template.
2. Republishes any previously published pages.
3. Reports progress for each page as it's processed.

This can affect many pages — the progress indicator helps you track the operation.

---

## Technical architecture

### SignalR hub

The `PublishingProgressHub` provides the real-time communication channel:

- **Authorization:** Only Editors and Administrators can connect.
- **Connection:** Established automatically when you open the publish interface.
- **Messages:** Progress updates and completion notifications are pushed from server to client.

### Progress messages

The hub broadcasts:

| Message | Payload | When |
| ------- | ------- | ---- |
| `PublishProgress` | Article ID, status, completed count, total count | After each page is processed |
| `PublishComplete` | Final count, success/failure summary | When all pages are done |

### Bulk publish endpoint

`POST /Editor/PublishStaticPages`

- **Request body:** Array of article IDs (GUIDs). Empty array = process all published pages.
- **Response:** `{ IsSuccess: bool, Count: int, Message: string }`
- **Authorization:** Editors and Administrators.

---

## Multi-tenancy

- SignalR connections are scoped to the current tenant.
- Progress updates are only sent to clients connected from the same tenant.
- The hub captures tenant context from the HTTP request.

---

## See Also

- [Publishing Modes](publishing-modes.md) — Static site generation and bulk publishing
- [Version History](version-history.md) — Template publish creates new article versions
- [Preload & Caching](preload-and-caching.md) — Cache warming after bulk operations
