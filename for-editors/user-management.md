---
canonical_title: User Management
description: Manage user accounts, roles, and author profiles from the SkyCMS admin dashboard.
doc_type: How-to
product_area: administration
user_intent: manage-users-roles-and-author-profiles
audience:
  - Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# User management

## Summary

Use this guide when you need to:

- create, confirm, or delete user accounts,
- assign or change roles,
- manage author profile information.

SkyCMS provides an admin dashboard for managing user accounts, roles, and author profiles.

## Accessing user management

Navigate to **Editor → Users** from the sidebar. User management is restricted to users with the **Administrator** role.

---

## User accounts

### Viewing users

The user inventory page displays a paginated, sortable table with:

- Email address
- Email confirmation status (confirmed / unconfirmed)
- Two-factor authentication status (ON / OFF badge)
- Phone number confirmation status
- Assigned roles

Use the pagination and sort controls to navigate large user lists.

### Creating a user

1. Click **Create** on the user list page.
2. Enter the user's email address.
3. Optionally auto-generate a password or enter one manually.
4. Click **Create**.
5. A confirmation page is displayed. If email delivery is configured, the user receives a confirmation email.

### Confirming emails

If a user hasn't confirmed their email:

- Click **Confirm Email** to manually confirm the account.
- Click **Resend Confirmation** to send a new verification email.
- Click **Unconfirm Email** to revoke confirmation status.

### Password resets

Click **Send Password Reset** next to any user to email them a password reset link. This requires a working email provider configuration.

### Deleting users

1. Select one or more users using the checkboxes.
2. Click **Delete** in the bulk actions bar.
3. Confirm the deletion.

> **Safeguard:** The system prevents deleting the last administrator account. At least one admin must remain.

---

## Role assignment

### Viewing a user's roles

Click **Roles** next to any user to see their current role membership.

### Assigning roles

1. Open the **Role Assignment** page for a user.
2. Toggle roles on or off.
3. Click **Save**.

Users can belong to multiple roles simultaneously. See [Roles & Permissions](../for-developers/roles-and-permissions.md) for the full permission matrix.

### Bulk role actions

From the user list, select multiple users and use the bulk actions **Add Role** or **Remove Role** to modify roles in batch.

---

## Author Profiles

Author profiles contain biographical information displayed on blog posts and article bylines.

### Managing Author Profiles

1. Navigate to **Editor → Users → Author Profiles**.
2. Browse the paginated, sortable author list.
3. Click **Edit** to update an author's profile:
   - Display name
   - Bio text
   - Social media links (Twitter, Instagram)
4. Click **Save**.

### Deleting author profiles

Click **Delete** next to an author profile to remove it. This removes the profile data only — the associated user account is not affected.

---

## Built-in roles

| Role | Purpose |
| ---- | ------- |
| **Administrator** | Full system access — user management, settings, CDN, storage, audit logs |
| **Editor** | Full content creation and publishing, template/layout management, file manager |
| **Author** | Create and edit own content, submit for review, file manager access |
| **Reviewer** | View content and provide feedback only |
| **Authenticated** | Reserved for future extensibility |
| **Anonymous** | Reserved for future extensibility |

Administrators can also create custom roles. See [Roles & Permissions](../for-developers/roles-and-permissions.md) for the full permission matrix.

---

## See also

- [Roles & Permissions](../for-developers/roles-and-permissions.md) — Full permission matrix and role architecture
- [Authentication & SSO](authentication.md) — Login methods, 2FA, passkeys, OAuth providers
