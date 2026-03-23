# Implementation Plan (Incremental)

## Scope
This plan targets SkyCMS Editor in-place evolution with minimal disruption.

## Phase 0: Foundations (No Runtime Loading Yet)

1. Add module domain models and persistence
- Add tables/entities:
  - `ModulePackage`
  - `ModuleInstallation`
  - `ModuleLifecycleEvent`
  - `ModuleTenantActivation` (optional for tenant-scoped enablement)
- Suggested location:
  - `Editor/Data/`
  - `Editor/Data/Migrations/*`

2. Add manifest parser and validator
- Validate JSON schema, required fields, semantic versions, capabilities.
- Suggested location:
  - `Editor/Services/Modules/Manifest/`

3. Add secure package ingestion service
- Reuse zip validation patterns from:
  - `Editor/Controllers/DeploymentController.cs`
- Validate extension, size, path traversal, file hash list.
- Suggested location:
  - `Editor/Services/Modules/Installer/`

## Phase 1: Admin Module Management UX

1. Create admin controller and views
- New controller:
  - `Editor/Controllers/ModulesController.cs`
- New views:
  - `Editor/Views/Modules/Index.cshtml`
  - `Editor/Views/Modules/Details.cshtml`

2. Add menu entry for module management
- Update main menu partial:
  - `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`
- Entry visible to Administrators only.

3. Add upload endpoint and workflow
- POST upload package
- Show validation summary and compatibility warnings
- Install as disabled by default

## Phase 2: Runtime Module Registry and Menu Contributions

1. Introduce module registry services
- Register in startup:
  - `Editor/Program.cs`
- Services:
  - `IModuleRegistry`
  - `IModuleMenuService`

2. Refactor menu rendering
- Replace direct hardcoded module area with dynamic menu composition.
- Keep core items static first, append dynamic module items.
- File touched:
  - `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`

3. Add role and tenant visibility filtering
- Evaluate menu item visibility per current user and tenant context.

## Phase 3: Server Runtime Loading (Trusted Modules)

1. Add module assembly loader
- Controlled assembly loading and startup contract invocation.
- Suggested location:
  - `Editor/Services/Modules/Runtime/`

2. Register module MVC parts
- Use MVC application part pattern in:
  - `Editor/Program.cs`

3. Add module route prefix policy
- Enforce `/modules/{moduleId}/...` to avoid collisions.

4. Add module static file provider
- Serve module assets from package extraction path.
- Extend static files middleware setup in:
  - `Editor/Program.cs`

## Phase 4: Health, Rollback, and Operations

1. Add health checks per module
- Track failures and state transitions (`Enabled -> Degraded -> Quarantined`).

2. Add rollback policy for updates
- Keep previous working package until new version is healthy.

3. Add audit reporting UI
- Show lifecycle events and failure diagnostics.

## Phase 5: Isolation Hardening (Optional)

1. Introduce isolated runtime mode for untrusted modules
- Out-of-process communication (HTTP/gRPC).

2. Capability enforcement expansion
- Fine-grained permissions and host-governed outbound call policies.

## File-Level Starting Points In Current Codebase

1. Startup and DI pipeline
- `Editor/Program.cs`

2. Main menu and layout
- `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`
- `Editor/Views/Shared/_Layout.cshtml`

3. Secure zip handling reference
- `Editor/Controllers/DeploymentController.cs`

4. Tenant context patterns
- `Editor/Boot/` and tenant middleware services

## Suggested MVP Definition of Done

1. Admin can upload and validate a signed module package.
2. Module can be installed and toggled enabled/disabled.
3. Enabled module can contribute one menu item with role gating.
4. Enabled module can serve one JS/CSS bundle from module path.
5. Lifecycle actions are audited.
6. Basic compatibility check blocks invalid modules.

## Risks and Mitigations

1. Security risk: arbitrary module code execution
- Mitigation: signed modules, trusted publisher store, explicit capability approvals.

2. Compatibility drift across Editor versions
- Mitigation: host API versioning and strict install/enable checks.

3. Tenant leakage risk in multi-tenant mode
- Mitigation: tenant-aware service boundaries and scoped activation records.

4. Dependency conflicts
- Mitigation: module packaging rules and controlled loading policy.
