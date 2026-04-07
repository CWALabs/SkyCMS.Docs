# SkyCMS Feature Catalog

A comprehensive inventory of every feature built into SkyCMS, organized by functional area. This catalog is intended for developers, editors, site builders, administrators, and anyone evaluating SkyCMS as a content management platform.

---

## Sections

| # | Section | What It Covers |
|---|---------|---------------|
| 1 | [Content Editing & Authoring](01-content-editing-and-authoring.md) | Page Editor (WYSIWYG), Page Builder (drag-and-drop), Code Editor, AI Copilot, Image Editor, Real-time collaboration |
| 2 | [Content Lifecycle & Publishing](02-content-lifecycle-and-publishing.md) | Article states, versioning, publishing modes, scheduling, URL management, export/import, CDN integration |
| 3 | [Blogging](03-blogging.md) | Blog streams, blog posts, blog templates, rendering, blog API |
| 4 | [Site Building](04-site-building.md) | Layouts, Templates, Pages, Widgets, Editable regions, Style guide support |
| 5 | [File & Media Management](05-file-and-media-management.md) | File Manager, multi-cloud storage, image processing, content delivery |
| 6 | [Administration & Security](06-administration-and-security.md) | Users, Roles, Permissions, Settings, Email, Contacts, Authentication, Rate limiting, Audit logs |
| 7 | [Multi-Tenancy & Architecture](07-multi-tenancy-and-architecture.md) | Tenant resolution, data isolation, FlexDb multi-database, CQRS, SignalR, middleware, Publisher architecture |
| 8 | [Deployment & Infrastructure](08-deployment-and-infrastructure.md) | Hosting (Azure, AWS, Docker, Cloudflare), Setup Wizard, Database/Storage/CDN/Email config, Demo, DocsPublisher, CI/CD, Licensing |
| — | [Documentation Gaps](documentation-gaps.md) | Running inventory of features that need new or improved documentation |

---

## Feature Highlights at a Glance

### For Content Creators & Editors

- Four editing modes: WYSIWYG, drag-and-drop Page Builder, Code Editor, and AI-assisted writing
- In-browser image editing (crop, resize, filters, annotate, watermark)
- Full version history with side-by-side comparison and restore
- Scheduled publishing with timezone support
- Real-time collaborative editing with article locking
- File manager with drag-and-drop upload and chunked transfer

### For Site Builders

- Three-layer architecture: Layouts → Templates → Pages
- Visual Page Builder (GrapesJS) with 15+ block categories
- Configurable editable regions with multiple toolbar profiles
- Community layout library for quick starts
- Template impact preview before mass-update
- Style guide template support

### For Administrators

- Role-based access control (6 built-in roles + custom)
- Per-article permission assignments
- Multi-provider email (Azure Communications, SendGrid, SMTP)
- Contact management with CSV export and MailChimp sync
- CDN configuration and cache purge
- AI Copilot configuration per tenant

### For Developers

- Multi-tenant architecture with automatic tenant resolution
- Four database providers (Cosmos DB, SQL Server, MySQL, SQLite) — auto-detected
- Three cloud storage providers (Azure Blob, S3, Cloudflare R2) — auto-detected
- CQRS + Mediator vertical-slice architecture
- SignalR real-time hubs
- REST API with rate limiting
- Docker, Azure Marketplace, and Cloudflare edge deployment
- Open source (GPL + MIT)

---

## Audience Quick-Reference

| I am a... | Start with sections... |
|-----------|----------------------|
| Content editor or author | 1, 2, 3, 5 |
| Site builder or designer | 1, 4, 5 |
| Administrator | 6, 8 |
| Developer | 7, 8, then all others |
| Evaluator comparing CMS platforms | This index, then drill into areas of interest |
