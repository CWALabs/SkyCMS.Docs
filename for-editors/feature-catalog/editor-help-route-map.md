---
canonical_title: Editor Help Route Map
description: Route-to-documentation mapping for context-aware Help behavior in SkyCMS editor surfaces.
doc_type: Reference
product_area: editor
user_intent: map-editor-routes-to-canonical-help-pages
audience:
  - Developers
  - Documentation Contributors
  - Product Owners
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Editor Help Route Map

Use this map to keep in-product Help aligned with canonical documentation pages.

## Route to Canonical Page Mapping

### Content Editing — Articles

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Editor/Index` | Pages Catalog (dashboard) | [Dashboard Overview](../dashboard-overview.md) |
| `/Editor/Create` | Create new page | [Creating Articles](../creating-articles.md) |
| `/Editor/VisualEditor/{id}` | Visual Editor | [Visual Editor](./visual-editor.md) |
| `/Editor/Edit/{id}` | Legacy visual editor route | [Visual Editor](./visual-editor.md) |
| `/Editor/EditCode/{id}` | Page code editing | [Code Editor](./code-editor.md) |
| `/Editor/AiHelp` | AI writing assistant | [AI Assistant](../ai-assistant.md) |

### Publishing and Scheduling

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Editor/Publish` | Single-page publish | [Publish a Page](../publish-a-page.md) |
| `/Editor/PublishPage` | Publish API endpoint | [Publish a Page](../publish-a-page.md) |
| `/Editor/UnpublishPage` | Unpublish endpoint | [Publish a Page](../publish-a-page.md) |
| `/Editor/Scheduler` | Scheduled publish queue | [Page Scheduling](../page-scheduling.md) |

### Version Management

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Editor/Versions/{id}` | Version history list | [Version History](../version-history.md) |
| `/Editor/Compare` | Side-by-side version diff | [Compare Page Versions](../compare-page-versions.md) |
| `/Editor/Trash` | Deleted pages / recovery | [Trash and Recovery](../trash-and-recovery.md) |
| `/Editor/Restore` | Restore deleted page | [Trash and Recovery](../trash-and-recovery.md) |

### Access Control and URL Management

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Editor/Permissions/{id}` | Per-article access control | [Article Permissions](../article-permissions.md) |
| `/Editor/ReservedPaths` | Reserved URL paths | [URL Management](../url-management.md) |
| `/Editor/CreateReservedPath` | Add reserved path | [URL Management](../url-management.md) |
| `/Editor/EditReservedPath/{id}` | Edit reserved path | [URL Management](../url-management.md) |

### Administration and Logging

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Editor/Logs` | Audit log viewer | [Audit Logging](../../for-developers/audit-logging.md) |
| `/Editor/ExportPage` | Export page content | [Content Export & Import](../content-export-import.md) |

### File Management

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/FileManager/Index` | File browser and operations | [File Management](./file-management.md) |
| `/FileManager/EditCode` | File code editing | [Code Editor](./code-editor.md) |
| `/FileManager/EditImage` | File image editing | [Image Editor](./image-editor.md) |
| `/FileManager/Import` | Import content files | [Content Export & Import](../content-export-import.md) |

### Layouts and Templates

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Layouts/Index` | Layouts list | [Layouts and Templates](../layouts-and-templates.md) |
| `/Layouts/Create` | Create layout | [Layouts and Templates](../layouts-and-templates.md) |
| `/Layouts/EditCode` | Layout code editor | [Code Editor](./code-editor.md) |
| `/Layouts/CommunityLayouts` | Community layout library | [Layouts and Templates](../layouts-and-templates.md) |
| `/Templates/Index` | Templates list | [Layouts and Templates](../layouts-and-templates.md) |
| `/Templates/Create` | Create template | [Layouts and Templates](../layouts-and-templates.md) |
| `/Templates/EditCode/{id}` | Template code editor | [Code Editor](./code-editor.md) |
| `/Templates/Pages/{id}` | Pages using template | [Layouts and Templates](../layouts-and-templates.md) |
| `/Templates/PreviewImpact/{id}` | Template change impact | [Layouts and Templates](../layouts-and-templates.md) |

### Blogging

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Blog/Index` | Blog list | [Blogging](../blogging.md) |
| `/Blog/Create` | Create blog | [Blogging](../blogging.md) |
| `/Blog/Edit/{id}` | Edit blog settings | [Blogging](../blogging.md) |
| `/Blog/Posts/{id}` | Blog posts list | [Blogging](../blogging.md) |

### Users and Roles

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/Users/Index` | User accounts list | [User Management](../user-management.md) |
| `/Users/Create` | Create user | [User Management](../user-management.md) |
| `/Users/AuthorInfos` | Author profile settings | [User Management](../user-management.md) |
| `/Roles/Index` | Roles list | [Role Management](../role-management.md) |
| `/Roles/Create` | Create role | [Role Management](../role-management.md) |
| `/Roles/UsersInRole/{id}` | Users assigned to role | [Role Management](../role-management.md) |

### Settings and Configuration

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/SkyCmsSettings/Index` | General site settings | [Site Settings](../site-settings.md) |
| `/SkyCmsSettings/CDN` | CDN configuration | [Site Settings](../site-settings.md) |
| `/SkyCmsSettings/AiProvider` | AI provider configuration | [AI Provider Setup](../ai-provider-setup.md) |

### Email and Contacts

| Editor route pattern | Surface | Canonical help target |
| --- | --- | --- |
| `/EmailAdmin/Index` | Email test and operations UI | [Email Admin](../email-admin.md) |
| `/Contact/Index` | Contact form submissions | [Contact Management](../contact-management.md) |
| `/Contact/MailChimp` | MailChimp integration | [Contact Management](../contact-management.md) |

## Fallback Rule

If no direct route mapping exists:

1. Open docs search UI in product.
2. If docs search cannot load, open docs home.

## Maintenance Rule

When a new editor route or user-facing page is added:

1. Create or confirm a canonical page.
2. Add mapping in product route-help map.
3. Add mapping row here.
4. Verify Help opens the expected destination.
