# Content Lifecycle & Publishing

SkyCMS provides a structured content lifecycle from draft creation through publication, with versioning, scheduling, URL management, and multiple publishing modes to fit different team workflows.

**Audiences:** Editors, Authors, Administrators, Developers

**Jump to:**

- [Article Lifecycle](#1-article-lifecycle)
- [Versioning](#2-versioning)
- [Publishing](#3-publishing)
- [Scheduled Publishing](#4-scheduled-publishing)
- [Publishing Modes](#5-publishing-modes)
- [URL & Path Management](#6-url--path-management)
- [Content Export & Import](#7-content-export--import)
- [CDN Integration](#8-cdn-integration)
- [Preload & Performance](#9-preload--performance)
- [Publishing Progress](#10-publishing-progress)

---

## 1. Article Lifecycle

> **Documentation:** [Article Lifecycle Reference (Editors)](../../for-editors/article-lifecycle-reference.md) · [Creating Articles](../../for-editors/creating-articles.md) · [Updating & Deleting Articles](../../for-editors/updating-and-deleting-articles.md) · [Article Lifecycle (Developers)](../../for-developers/article-lifecycle.md)

Every piece of content in SkyCMS follows a defined lifecycle with clear state transitions.

### Content States

| State | Visibility | Description |
|-------|-----------|-------------|
| **Draft** | Private | Work in progress, only visible to editors in the dashboard |
| **Scheduled** | Private | Queued for future publication at a specific date/time |
| **Published** | Public | Live and accessible to site visitors |
| **Unpublished** | Private | Removed from public view but retained with full history |
| **Trashed** | Private | Soft-deleted, recoverable from the trash bin |

### State Transitions

```
Create → Draft → Save/Revise → Preview → Publish (or Schedule)
                                            ↓
                                        Published → Update/Republish
                                            ↓
                                    Unpublish / Trash / Archive
                                            ↓
                                  Restore from Trash (optional)
                                            ↓
                                  Permanent Delete (irreversible)
```

---

## 2. Versioning

> **Documentation:** [Version History Guide](../../for-editors/version-history.md) · [Article Lifecycle Reference](../../for-editors/article-lifecycle-reference.md)

SkyCMS maintains a full version history for every article, layout, and template.

### Version Management

- Every save creates a new version record
- Version history view with list of all saved versions
- Each version records: author, timestamp, version number
- Browse and inspect any previous version

### Version Comparison

- Side-by-side diff view comparing any two versions
- Visual highlighting of additions, deletions, and changes
- Compare current draft against any historical version

### Restore

- Restore any previous version to become the current draft
- Restore does not delete other versions — it creates a new version from the restored content
- Restore articles from the trash bin back to draft state

---

## 3. Publishing

> **Documentation:** [Publishing Workflow](../../deployment/publishing-workflow.md) · [Article Lifecycle Reference](../../for-editors/article-lifecycle-reference.md)

### Direct Publishing

- One-click publish from the editor
- Immediate availability on the live site
- Publish status and timestamp displayed in the editor toolbar
- "Last published" timestamp always visible

### Unpublishing

- Remove content from public view without deleting it
- Content remains in the editor for future re-publication
- Version history preserved

### Preview

- Preview content before publishing
- See the page as visitors will see it, with the current layout and template applied

---

## 4. Scheduled Publishing

> **Documentation:** [Page Scheduling](../../for-editors/page-scheduling.md)

Automate content publication at a future date and time.

### Scheduling Features

- Set a specific publish date and time per article
- Timezone-aware scheduling
- Per-version scheduling — schedule a specific version to go live

### Scheduler Dashboard

- View all upcoming scheduled jobs
- Inspect execution history (past publish events)
- Identify and retry failed jobs
- Cancel or reschedule pending publications

### Recurring Publishing

- Support for scheduled recurring publication workflows

---

## 5. Publishing Modes

> **Documentation:** [Publishing Modes Guide](../../for-editors/publishing-modes.md) · [Publishing Workflow](../../deployment/publishing-workflow.md)

SkyCMS supports multiple publishing strategies to fit different team sizes and deployment architectures.

### Direct Publishing Mode

- Edit and publish immediately
- No review gate — best for small teams or individual publishers
- Simplest workflow

### Staged Publishing Mode

- Publish to a staging environment first
- Review and test before promoting to production
- Rollback capability if issues are found
- Approval workflow before go-live

### Static Site Generation

- Generate static HTML files from CMS content
- Deploy to JAMstack / edge hosting (Cloudflare, Azure Static, S3)
- Maximum performance: pre-rendered pages served from CDN
- Secure: no server-side runtime exposed to visitors
- Publish individual pages or bulk-publish all pages

### Git-Based Publishing

- Commit content to a Git repository
- CI/CD pipeline integration for automated deployment
- Familiar developer workflow with pull requests and reviews

---

## 6. URL & Path Management

> **Documentation:** [URL & Redirect Management Guide](../../for-editors/url-management.md)

### Page URLs

- Each article has a URL path (slug) derived from its title
- Title uniqueness validation (check before save)
- URL-friendly slug generation

### URL Redirects

- Create, edit, and delete redirect rules (from-URL → to-URL)
- Manage redirects from the editor dashboard
- Useful for URL migrations, renamed pages, and vanity URLs

### Reserved Paths

- Define URL paths reserved by the system or custom routes
- Create, edit, and delete reserved paths
- Prevents content from being created at system-critical URLs
- Paginated management with filtering

---

## 7. Content Export & Import

> **Documentation:** [Content Export & Import Guide](../../for-editors/content-export-import.md) · [DocsPublisher Quick Start](../../../SkyCMS.DocsPublisher/QUICK_START.md)

### Page Export

- Export individual articles as JSON or HTML
- Includes content, metadata, and version information

### Page Import

- Import HTML pages into SkyCMS via the File Manager
- Map imported content to layouts and templates

### Docs Import API

- HTTP API for automated content import (`PUT /_api/import/docs/{sourceKey}`)
- Idempotent upsert — create or update based on source key
- Delete via `DELETE /_api/import/docs/{sourceKey}`
- Rate-limited for abuse prevention
- Used by the DocsPublisher tool for Markdown → CMS sync

---

## 8. CDN Integration

> **Documentation:** [CDN Overview](../../configuration/cdn/overview.md) · [Azure Front Door](../../configuration/cdn/azure-front-door.md) · [Cloudflare CDN](../../configuration/cdn/cloudflare.md) · [CloudFront](../../configuration/cdn/cloudfront.md) · [Sucuri](../../configuration/cdn/sucuri.md) · [CDN Configuration Reference](../../configuration/cdn/configuration-reference.md)

### Cache Management

- Refresh / purge CDN cache from the editor dashboard
- CDN purge on publish (failures don't block publishing)
- Per-tenant CDN isolation

### Supported CDN Providers

- Azure CDN / Azure Front Door
- Cloudflare
- AWS CloudFront
- Sucuri

---

## 9. Preload & Performance

> **Documentation:** [Preload & Caching Guide](../../for-editors/preload-and-caching.md)

### Content Preloading

- Preload view for warming content caches
- Ensure pages are ready for visitors after publish

### Caching Layers

- In-memory caching for frequently accessed content
- Distributed Cosmos DB caching for multi-instance deployments
- Static file caching for generated pages
- Cache key prefixing for multi-tenant isolation

---

## 10. Publishing Progress

> **Documentation:** [Publishing Progress Guide](../../for-editors/publishing-progress.md)

### Real-Time Progress Tracking

- SignalR-powered progress reporting during bulk publish operations
- Live progress updates streamed to the editor UI
- Connection/disconnection handling for reliable progress display
- Available to Editors and Administrators
