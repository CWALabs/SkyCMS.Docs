# Architecture Overview

## Goal
Allow administrators to upload a module package that can contribute:

- Server endpoints and business logic
- Client scripts/styles and optional views
- Main menu entries in the Editor UI

without changing SkyCMS host code for each new module.

## High-Level Components

1. Module Package
- A signed zip containing:
  - `module.manifest.json`
  - `server/` binaries and metadata
  - `wwwroot/` static assets
  - Optional SQL/data migration scripts (controlled)

2. Module Installer
- Validates package signature and checksums.
- Verifies manifest schema and compatibility.
- Extracts module files to host module storage.
- Creates module records in database as `Installed` and `Disabled`.

3. Module Registry
- Runtime service that tracks installed/enabled modules.
- Resolves tenant-scoped effective module set.
- Exposes module metadata and menu contributions.

4. Module Host Runtime
- Loads enabled module assemblies via controlled AssemblyLoadContext.
- Registers MVC controllers via application parts.
- Serves static assets from per-module web root.
- Executes guarded startup hooks from modules.

5. Menu Composition Layer
- Core menu remains first-party.
- Module menu items are dynamically appended from registry.
- Visibility rules evaluated by role, tenant, and feature flags.

6. Admin UX
- Module management page:
  - Upload
  - Validate
  - Enable/Disable
  - View logs
  - Uninstall (if allowed)

## Data and Control Flow

1. Install flow
- Admin uploads package.
- Installer validates signature, schema, compatibility, and policy.
- Package is extracted to module storage.
- Registry stores metadata in DB.
- Module remains disabled until explicit enable.

2. Enable flow
- Admin enables module globally or per tenant.
- Runtime validates dependencies and host API version.
- Module activation marker is persisted.
- Menu and routes become visible according to rules.

3. Request flow
- Incoming request is processed with existing tenant resolution.
- Module services/controllers execute in-process.
- Authorization and tenant policy gates are applied by host and module.

## Trust and Security Model

1. Publisher trust
- Module package must be signed.
- Certificate or key must exist in trusted publisher store.

2. Capability declarations
- Manifest declares requested capabilities.
- Host allows only approved capabilities.

3. Isolation baseline
- In-process for MVP.
- Optional Phase 2 out-of-process execution for stronger isolation.

4. Operational controls
- Audit all lifecycle actions.
- Health checks and automatic quarantine on repeated failures.
- Emergency global disable switch.

## Compatibility Strategy

1. Host API versioning
- Manifest declares `hostApiVersion` range.
- Host rejects incompatible modules at install or enable time.

2. Migration safety
- Module migrations are explicit, idempotent, and reversible where possible.
- Multi-provider support required if module touches persistence shared with FlexDb providers.

3. Upgrade behavior
- During host upgrade, modules are evaluated in compatibility check mode.
- Incompatible modules are disabled with clear admin warning.

## Deployment Model Options

1. Option A: In-process module model (MVP)
- Faster to implement.
- Better performance.
- Suitable for trusted/private modules.

2. Option B: Out-of-process module model (Phase 2)
- Stronger security isolation.
- Better fault containment.
- Higher operational complexity.

## Recommended Phased Path

1. Deliver in-process MVP with strict signing and admin controls.
2. Add guardrails: compatibility checks, health scoring, rollback.
3. Introduce isolated runtime for third-party/untrusted modules.
