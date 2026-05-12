---
canonical_title: Role Management
description: Create and manage editor roles in SkyCMS to control what users can access and do across the CMS.
doc_type: How-to
product_area: administration
user_intent: create-and-manage-editor-roles
audience:
  - Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Role Management

**Roles** define what a user can do in SkyCMS. Each role is a named set of permissions. When you assign a user to a role, they inherit everything that role allows.

Use this guide to create roles, manage who belongs to them, and understand the built-in role structure.

## Built-in Roles

SkyCMS includes several built-in roles that cover most use cases:

| Role | Typical capabilities |
| --- | --- |
| Administrator | Full access to all editor features, settings, and user management |
| Content Manager | Create, edit, publish, and manage all content; manage users |
| Editor | Create and edit content; limited publish rights |
| Author | Create and edit own content only |
| Reviewer | View and comment on drafts; cannot publish |

For the full permission matrix, see [Roles & Permissions (developer reference)](../for-developers/roles-and-permissions.md).

## Opening Role Management

Go to **Editor → Roles** in the top navigation. The list shows all roles defined in the system.

## Create a Role

1. Click **New Role**.
2. Enter a role name.
3. Click **Create**.
4. The role is created. Assign permissions to it (if custom permission sets are configured) or assign users to it.

## View and Manage Users in a Role

1. Click the role name.
2. Click **Users in Role**.
3. The list shows all user accounts assigned to this role.
4. To add a user: use the search box to find the account, then click **Add**.
5. To remove a user: click **Remove** next to their account.

## Delete a Role

1. Find the role in the list.
2. Click **Delete** from the role's action menu.
3. Confirm.

!!! warning
    Deleting a role removes it from all users currently assigned to it. Confirm that affected users have an alternative role, or their access will be revoked.

## Notes

- A user can belong to multiple roles.
- Role assignments take effect the next time the user logs in or their session refreshes.
- Custom roles inherit the permission structure defined by the developer. Contact your administrator if you need a new custom role type.

## Related Guides

- [User Management](user-management.md) — create and manage user accounts
- [Article Permissions](article-permissions.md) — per-article access overrides
- [Authentication & SSO](authentication.md) — login and identity provider settings
- [Roles & Permissions (developer reference)](../for-developers/roles-and-permissions.md)
