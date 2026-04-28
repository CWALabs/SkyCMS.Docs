---
canonical_title: Role-based access control and authorization
description: Understand SkyCMS role-based authorization model, built-in roles, permission matrix, and best practices for managing user access.
doc_type: Reference
product_area: administration
user_intent: understand-skycms-rbac-authorization-model
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Role-based access control and authorization

## Summary

Understand SkyCMS role-based authorization model, built-in roles, permission matrix, and best practices for managing user access.

## Authorization model

SkyCMS implements ASP.NET Core declarative authorization using role-based access control (RBAC). Authorization is enforced through:

1. `[Authorize]` attribute at the controller or action method level.
2. Role-based checks to validate access for protected resources.
3. Automatic role initialization on first launch.
4. Role manager support for custom roles in admin UI.

### How authorization works

When a user requests a protected action:

1. SkyCMS checks if the user is authenticated.
2. SkyCMS verifies the user's assigned roles against required roles for the action.
3. Access is granted if the user is in at least one required role.
4. Access is denied with HTTP 403 Forbidden when roles do not match.

## Built-in roles

SkyCMS requires six predefined roles. These are automatically created on startup.

### Editor/CMS roles

#### Administrators

- Description: Full system access and administrative control.
- Key capabilities:
  - Create, modify, and delete all roles.
  - Manage user accounts and assign roles.
  - Create and modify page templates and layouts.
  - Configure system settings.
  - Manage all content (pages, articles, etc.).
  - Access file manager with full permissions.
  - Configure CDN and storage settings.
  - View audit logs and diagnostics.

#### Editors

- Description: Full content creation and management permissions.
- Key capabilities:
  - Create, edit, and publish pages and articles.
  - Modify existing page layouts and templates (in some contexts).
  - Manage files and media through the file manager.
  - View published and draft content.
  - Cannot: Manage user accounts, system configuration, or roles.
  - Cannot: Create or modify templates/layouts (restricted context).

#### Authors

- Description: Content creation with limited publishing rights.
- Key capabilities:
  - Create and edit their own pages and articles.
  - Submit content for review.
  - Access file manager to upload media.
  - View their own published content.
  - Cannot: Publish directly (must be reviewed by Editors or Administrators).
  - Cannot: Modify other users' content.
  - Cannot: Access system settings or user management.

#### Reviewers

- Description: Content review and approval capability.
- Key capabilities:
  - View all pages in editor interface.
  - Review content pending publication.
  - Provide feedback on draft content.
  - Cannot: Create or edit content.
  - Cannot: Publish content directly.
  - Cannot: Manage users or system settings.

### Portal/Public roles

#### Authenticated

- Description: Represents any authenticated user (future extensibility).
- Current usage: Reserved for future use in core features.

#### Anonymous

- Description: Represents unauthenticated visitors (future extensibility).
- Current usage: Reserved for future use in core features.

## Permission matrix

| Feature | Admin | Editor | Author | Reviewer |
| --- | --- | --- | --- | --- |
| Editor dashboard | Yes | Yes | Yes | Yes |
| Create pages | Yes | Yes | Yes | No |
| Edit pages | Yes | Yes | Own | No |
| Publish pages | Yes | Yes | No | No |
| Delete pages | Yes | Yes | No | No |
| Manage templates | Yes | Yes | No | No |
| Manage layouts | Yes | Yes | Limited | No |
| File manager | Yes | Yes | Yes | No |
| Manage users | Yes | No | No | No |
| Manage roles | Yes | No | No | No |
| System settings | Yes | No | No | No |
| View content for review | Yes | Yes | Yes | Yes |

## Role assignment

### Assigning roles during setup

The first user to register or log in is automatically assigned the Administrators role to bootstrap the system. Subsequent users require explicit role assignment.

### Assigning roles in the admin interface

1. Navigate to Administration -> Users in the SkyCMS editor.
2. Select a user.
3. Under Roles, choose role(s).
4. Save changes.

Users can be assigned multiple roles simultaneously.

### Assigning roles via code

```csharp
var userManager = serviceProvider.GetRequiredService<UserManager<IdentityUser>>();
var result = await userManager.AddToRoleAsync(user, "Editors");

if (result.Succeeded)
{
    // Role assignment successful
}
```

## Creating custom roles

Administrators can create custom roles for specialized workflows.

### Creating a custom role

1. Navigate to Administration -> Roles in the SkyCMS editor.
2. Click Add New Role.
3. Enter a role name (for example, ContentReviewers).
4. Click Create.

### Important constraints

- Protected roles should not be deleted or modified:
  - `Administrators`
  - `Authors`
  - `Editors`
  - `Reviewers`
  - `Authenticated`
  - `Anonymous`
- Custom roles are not protected and can be removed if no longer needed.

### Using custom roles

Custom roles can be referenced in authorization attributes when extending controllers.

```csharp
[Authorize(Roles = "Administrators, CustomReviewers")]
public IActionResult SensitiveOperation()
{
    // Only Administrators and CustomReviewers can access this action
    return Ok();
}
```

## Authorization at different levels

### Controller-level authorization

Authorization at controller level applies to all actions in the controller.

```csharp
[Authorize(Roles = "Administrators")]
public class RolesController : Controller
{
    // All actions in this controller require Administrators role
}
```

Example controllers:

- `UsersController` - Restricted to Administrators.
- `RolesController` - Restricted to Administrators.

### Action-level authorization

Authorization can be applied to individual actions for finer control.

```csharp
[Authorize(Roles = "Administrators, Editors")]
public IActionResult ManageLayouts()
{
    // Only Administrators and Editors can access this action
}
```

Example from EditorController:

- `SavePageAsync()` - Requires Administrators, Editors, Authors.
- `PublishPageAsync()` - Requires Administrators, Editors.
- `DeletePageAsync()` - Requires Administrators, Editors.
- `CreateTemplate()` - Requires Administrators.

### Visual Editor hub

The Visual Editor collaborative hub requires specific roles.

```csharp
[Authorize(Roles = "Reviewers, Administrators, Editors, Authors")]
public class LiveEditorHub : Hub
{
    // Real-time editing only available to these roles
}
```

## Best practices

### 1. Principle of least privilege

Assign users the minimum role needed for their responsibility.

### 2. Regular role audits

Review assignments regularly to remove excessive or stale access.

### 3. Segregation of duties

Avoid combining conflicting roles for sensitive workflows.

### 4. Custom role naming

Use clear role names such as `VideoContentCreators` or `LocalPublishers`.

### 5. Document role responsibilities

Keep role documentation current when adding custom roles.

### 6. Monitor administrative actions

Track role assignments, removals, and role creation activity.

### 7. Protect administrator credentials

Use strong credentials, MFA where available, and minimize administrator count.

## Troubleshooting authorization issues

### User cannot access editor

Symptoms: Access denied or repeated login redirects.

Resolution:

1. Verify user has at least one role assigned.
2. Validate required role for requested action.
3. Confirm role assignment was not revoked.
4. Log out and back in to refresh claims.

### Access denied on specific action

Symptoms: User can access some features but not others.

Resolution:

1. Check `[Authorize(Roles = "...")]` on action/controller.
2. Verify user belongs to one of required roles.
3. Confirm action-level and controller-level rules are consistent.
4. Validate custom role naming and spelling.

### Role created but not working

Symptoms: Custom role exists, authorization still fails.

Resolution:

1. Verify exact role name matching.
2. Confirm user assigned to that custom role.
3. Confirm code includes custom role in authorization attributes.
4. Re-login to refresh claims.
5. Check caching layers if claims appear stale.

### Missing required roles on startup

Symptoms: Startup errors about missing roles.

Resolution:

1. Check `SetupNewAdministrator.cs` initialization.
2. Verify database connectivity.
3. Review startup logs for role-creation failures.
4. Ensure all roles in required-role initialization are present.

### User has role but cannot access

Symptoms: Role is assigned but action still denied.

Resolution:

1. Clear browser cookies/session.
2. Re-authenticate user.
3. Check for additional authorization checks beyond role attributes.
4. Verify no stricter custom policy blocks access.
5. Inspect application logs for auth failures.

## Related guides

- [For Developers](./index.md)
- [Developer architecture overview](./architecture.md)
- [Middleware pipeline](./middleware-pipeline.md)
- [Reference troubleshooting](../reference/troubleshooting.md)

## Code references

The following source files are in the SkyCMS repository:

- Role definition: `Editor/Data/RequiredIdentityRoles.cs`
- Role initialization: `Editor/Services/SetupNewAdministrator.cs`
- Role management UI: `Editor/Controllers/RolesController.cs`
- User management: `Editor/Controllers/UsersController.cs`
- Content editor actions: `Editor/Controllers/EditorController.cs`
