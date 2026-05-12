---
canonical_title: Article Permissions
description: Control who can view or edit individual pages in SkyCMS using per-article role and user permissions.
doc_type: How-to
product_area: editor
user_intent: set-per-article-access-permissions
audience:
  - Content Managers
  - Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Article Permissions

**Article Permissions** let you restrict access to individual pages. You can control which roles or individual users are allowed to view or edit a specific page, independently of their global role assignments.

By default, a page inherits the access rules of its template and layout. Permissions settings override those defaults for a single article.

## When to Use Article Permissions

- A page contains sensitive or confidential content that should only be visible to certain roles
- You want a draft page to be editable only by a specific team
- You need to grant a guest user or contractor access to one page without broadening their global role

## Opening Permissions for a Page

1. Go to the **Pages Catalog** (Editor home).
2. Find the page you want to restrict.
3. Click the **More (...)** menu on the page row.
4. Select **Permissions**.

The Permissions screen shows two tabs: **Roles** and **Users**.

## Role Permissions

The **Roles** tab lets you grant or revoke access by role. This is the recommended approach for most situations.

### Grant a role access

1. Open the **Roles** tab.
2. Use the search or list to find the role.
3. Check the **Allow** box next to the role.
4. Save.

### Revoke a role

1. Uncheck **Allow** next to the role.
2. Save.

## User Permissions

The **Users** tab lets you assign access to individual user accounts, overriding role-level rules.

### Grant a user access

1. Open the **Users** tab.
2. Find the user by name or email.
3. Check **Allow** next to their account.
4. Save.

## Clearing All Restrictions

To revert a page to default (inherited) permissions:

1. Open Permissions for the page.
2. Uncheck all role and user assignments.
3. Save.

The page will then inherit access rules from the global settings.

## Notes

- Permissions apply to the article at its current version. New versions inherit the same permissions.
- Permissions affect editor-side visibility, not necessarily public-facing site access (which is controlled by your site's front-end access rules).
- Only users with the Administrator or Content Manager role can modify article permissions.

## Related Guides

- [Role Management](role-management.md) — create and manage roles
- [User Management](user-management.md) — manage user accounts
- [Dashboard Overview](dashboard-overview.md) — finding pages in the Pages Catalog
- [Roles & Permissions (developer reference)](../for-developers/roles-and-permissions.md)
