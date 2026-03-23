# SkyCMS Editor Module Framework Blueprint

This folder documents a practical, incremental module framework for SkyCMS Editor that enables:

- Uploadable module packages
- Server-side logic extensions
- Client-side UI/logic extensions
- Main-menu contributions without host code edits per module

## Documents

1. [01-Architecture-Overview.md](01-Architecture-Overview.md)
   - End-to-end architecture and trust model
2. [02-Module-Manifest-Spec.md](02-Module-Manifest-Spec.md)
   - JSON manifest schema proposal and examples
3. [03-Lifecycle-State-Machine.md](03-Lifecycle-State-Machine.md)
   - Install/enable/disable/update/uninstall lifecycle
4. [04-Host-Contracts.md](04-Host-Contracts.md)
   - Proposed host interfaces for menu, assets, server, and initialization
5. [05-Implementation-Plan.md](05-Implementation-Plan.md)
   - Incremental rollout plan mapped to current SkyCMS files
6. [06-First-3-PRs-Plan.md](06-First-3-PRs-Plan.md)
   - Three small, safe implementation PR slices with exact file touch points
7. [07-PR1-Execution-Checklist.md](07-PR1-Execution-Checklist.md)
   - Implementation-ready checklist, estimates, and commit breakdown for PR1

## Design Principles

- Safe by default: modules are disabled on install until explicitly enabled.
- Admin control: install, approve, rollback, and uninstall actions are administrator-only.
- Tenant-aware behavior: module enablement can be global or tenant-scoped.
- Minimal host coupling: module APIs are versioned and intentionally small.
- Operational visibility: every lifecycle action is auditable.

## Non-Goals For MVP

- Running untrusted code from arbitrary publishers with full zero-trust isolation.
- Runtime binary hot-swap without process restart.
- Full marketplace/discovery UX.

## Current SkyCMS Anchors Used

- Main menu rendering: `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`
- Main layout include: `Editor/Views/Shared/_Layout.cshtml`
- MVC application part loading pattern: `Editor/Program.cs`
- Secure zip deployment patterns: `Editor/Controllers/DeploymentController.cs`
- Existing plugin-ish model concept in designer: `Editor/Models/GrapesJs/DesignerConfig.cs`
