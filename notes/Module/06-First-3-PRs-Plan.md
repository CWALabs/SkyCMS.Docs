# First 3 Implementation PRs (Small, Safe Slices)

## Objective
Provide a low-risk sequence that prepares SkyCMS.Editor for modules while preserving current behavior.

## Constraints

1. Do not load third-party module assemblies yet.
2. Keep host IMediator scanning trusted host-only.
3. Maintain existing menu behavior unless a feature flag is on.
4. Add tests with each slice.

## PR 1: Dynamic Menu Foundation (No Modules Yet)

### Goal
Refactor the common navbar to support dynamic menu composition while preserving all current menu items and role behavior.

### In Scope

1. Introduce a menu model and menu service for core menu entries.
2. Update `_CosmosMainMenuPartial.cshtml` to render from model data.
3. Add a host-only extension seam where module menu items can be appended later.

### Out of Scope

1. Upload/install/enable module packages.
2. Runtime module loading.

### Exact File Touch Points

1. Modify existing:
- `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`
- `Editor/Program.cs`

2. Add new (suggested):
- `Editor/Services/Menu/ICosmosMenuService.cs`
- `Editor/Services/Menu/CosmosMenuService.cs`
- `Editor/Models/Menu/CosmosMenuItem.cs`
- `Editor/Models/Menu/CosmosMenuViewModel.cs`

3. Optional helper updates:
- `Editor/Views/Shared/_Layout.cshtml` (only if needed for model wiring)

### Program.cs Changes

1. Register menu service as scoped.
2. Keep all current IMediator registration unchanged.

### Acceptance Criteria

1. Main menu renders exactly as before for existing roles.
2. No visual regressions in Editor wrapper and normal layout pages.
3. Menu rendering unit tests pass.

### Test Touch Points

1. Add tests (suggested):
- `Tests/Editor/Services/Menu/CosmosMenuServiceTests.cs`
- `Tests/Editor/Views/Shared/CosmosMainMenuPartialTests.cs` (or equivalent rendering assertions)

---

## PR 2: Module Registry Skeleton + Admin Visibility Hook

### Goal
Add module metadata persistence and registry read path, then expose a static "Modules" admin menu link (feature-flagged) without enabling runtime module code.

### In Scope

1. Add module persistence entities and migration.
2. Add `IModuleRegistry` read API and basic implementation.
3. Add admin-only "Modules" entry to the menu through the new menu service.

### Out of Scope

1. Package upload/installer.
2. Module assembly loading or dynamic route registration.

### Exact File Touch Points

1. Modify existing:
- `Editor/Program.cs`
- `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml` (only if additional rendering metadata is needed)
- `Editor/Data/ApplicationDbContext*.cs` (where entity sets are declared)

2. Add new (suggested):
- `Editor/Services/Modules/Registry/IModuleRegistry.cs`
- `Editor/Services/Modules/Registry/ModuleRegistry.cs`
- `Editor/Models/Modules/ModuleInstallation.cs`
- `Editor/Models/Modules/ModuleLifecycleEvent.cs`
- `Editor/Controllers/ModulesController.cs` (read-only index/details placeholder)
- `Editor/Views/Modules/Index.cshtml`
- `Editor/Views/Modules/Details.cshtml`
- `Editor/Data/Migrations/<provider>/...` (new migration per provider strategy already used)

### Program.cs Changes

1. Register `IModuleRegistry` and dependencies.
2. Keep host IMediator registration restricted to host assemblies.

### Acceptance Criteria

1. Administrators can open a Modules page.
2. Menu item visibility is role-gated and feature-flagged.
3. No runtime module loading occurs.

### Test Touch Points

1. Add tests (suggested):
- `Tests/Editor/Services/Modules/ModuleRegistryTests.cs`
- `Tests/Editor/Controllers/ModulesControllerTests.cs`

---

## PR 3: Package Validation and Install as Disabled

### Goal
Implement secure package upload + validation pipeline, persisting module records as `Installed` and `Disabled` only.

### In Scope

1. Add module package upload endpoint (admin-only).
2. Validate package structure and manifest (`module.manifest.json`).
3. Enforce zip hardening checks (size, extension, path traversal, hash verification optional for first cut).
4. Persist installation metadata and lifecycle event.

### Out of Scope

1. Enabling modules.
2. Loading module assemblies.
3. Registering module MVC parts/routes.

### Exact File Touch Points

1. Modify existing:
- `Editor/Program.cs`
- `Editor/Controllers/DeploymentController.cs` (reference patterns only; avoid behavior changes unless extracting shared zip validation helper)
- `Editor/Controllers/ModulesController.cs`
- `Editor/Views/Modules/Index.cshtml`

2. Add new (suggested):
- `Editor/Services/Modules/Installer/IModuleInstaller.cs`
- `Editor/Services/Modules/Installer/ModuleInstaller.cs`
- `Editor/Services/Modules/Manifest/IModuleManifestValidator.cs`
- `Editor/Services/Modules/Manifest/ModuleManifestValidator.cs`
- `Editor/Models/Modules/ModulePackageRecord.cs`
- `Editor/Models/Modules/ModuleManifest.cs`

### Program.cs Changes

1. Register installer and manifest validation services.
2. Do not add module assembly scanning.
3. Keep IMediator host-only and unchanged.

### Acceptance Criteria

1. Admin can upload a package and receive validation feedback.
2. Valid package is persisted as disabled install record.
3. Invalid package is rejected with clear error details.
4. No module code executes after install.

### Test Touch Points

1. Add tests (suggested):
- `Tests/Editor/Services/Modules/ModuleInstallerTests.cs`
- `Tests/Editor/Services/Modules/ModuleManifestValidatorTests.cs`
- `Tests/Editor/Controllers/ModulesUploadTests.cs`

---

## Cross-PR Safety Checklist

1. Keep module feature behind `Modules:Enabled` config flag until PR 3 is complete.
2. Add audit logs for module admin actions.
3. Add anti-forgery and role checks on module admin endpoints.
4. Ensure all new DB changes work across SQL Server, MySQL, SQLite, and Cosmos-compatible strategies used by the repository.
5. No changes to host mediator scan scope that could register module handlers.

## Suggested Merge Order

1. PR 1 first, because it creates the UI seam safely.
2. PR 2 second, because it adds persistence and admin observability.
3. PR 3 third, because installer logic depends on registry and admin UX.

## Follow-up PRs (After First 3)

1. Enable/Disable workflow with lifecycle state machine.
2. Module runtime loader and namespaced MVC/static assets.
3. Health/degraded/quarantine automation.
