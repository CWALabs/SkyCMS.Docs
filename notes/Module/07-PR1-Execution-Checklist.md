# PR1 Execution Checklist: Dynamic Menu Foundation

## Purpose
Convert the shared navbar from hardcoded markup into a model-driven composition path while preserving existing behavior.

## Guardrails

1. No module package loading in this PR.
2. No runtime module assembly scanning in this PR.
3. No host IMediator registration changes except confirming existing trusted-host behavior remains unchanged.
4. Preserve current role-based visibility and menu ordering.
5. Ship behind a feature flag if needed for rollback safety.

## Estimated Effort

1. Design alignment and file scaffolding: 0.5 day
2. Service/model implementation: 0.5 day
3. Razor partial refactor and parity fixes: 0.5 day
4. Tests and verification: 0.5 to 1 day

Estimated total: 2 to 2.5 days

## Proposed Work Breakdown

### Step 1: Add Menu Domain Models

Status goal: compile-only changes, no UI behavior changes yet.

1. Add `CosmosMenuItem` model.
2. Add `CosmosMenuSection` or equivalent grouping model.
3. Add `CosmosMenuViewModel` root model.
4. Include fields needed by current menu behavior:
- id
- label
- href or route
- icon css class
- order
- roles
- visibility flags
- optional child items

Suggested files:

- `Editor/Models/Menu/CosmosMenuItem.cs`
- `Editor/Models/Menu/CosmosMenuViewModel.cs`

### Step 2: Add Menu Service Contract and Baseline Implementation

Status goal: service can produce core menu model equivalent to existing static menu.

1. Add interface for menu composition.
2. Implement service that builds core menu entries only.
3. Keep module contributions as empty list seam for now.
4. Keep role checks host-side and deterministic.

Suggested files:

- `Editor/Services/Menu/ICosmosMenuService.cs`
- `Editor/Services/Menu/CosmosMenuService.cs`

### Step 3: Register Service in Startup

Status goal: service is available to views/controllers via DI.

1. Register menu service in `Program.cs` as scoped.
2. Do not alter current mediator registration paths.
3. Add short code comment describing this is the future module menu seam.

Touch point:

- `Editor/Program.cs`

### Step 4: Refactor Main Menu Partial to Model-Driven Rendering

Status goal: menu output stays functionally equivalent for all current roles.

1. Inject menu service into partial or pass view model from layout/controller.
2. Replace static menu item list with loop over model sections/items.
3. Keep existing ids and hooks used by JavaScript where possible:
- `btnManage`
- `ddManageMenu`
- `editorDropDown`
- `ddEditMenu`
4. Keep existing JS behavior intact in this PR.

Touch point:

- `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`

Optional touch point if needed for model wiring:

- `Editor/Views/Shared/_Layout.cshtml`

### Step 5: Add Regression Tests

Status goal: role-visibility and menu-presence parity is covered.

1. Service unit tests:
- Admin sees Users, Settings, Publish Website
- Editor sees Templates and Site Design but not admin-only entries
- Author/reviewer visibility parity with current behavior

2. Rendering tests or view-model snapshot tests:
- menu ids remain stable
- expected links are present for each role

Suggested files:

- `Tests/Editor/Services/Menu/CosmosMenuServiceTests.cs`
- `Tests/Editor/Views/Shared/CosmosMainMenuPartialTests.cs`

### Step 6: Manual Verification Matrix

Status goal: smoke-test all key role paths in running app.

1. Anonymous user
2. Reviewer
3. Author
4. Editor
5. Administrator

For each role validate:

1. menu renders without errors
2. expected entries appear
3. restricted entries are hidden
4. Edit dropdown still loads via existing JS flow

## Suggested Commit Breakdown

1. Commit 1: add menu models
- Files:
  - `Editor/Models/Menu/CosmosMenuItem.cs`
  - `Editor/Models/Menu/CosmosMenuViewModel.cs`

2. Commit 2: add menu service and DI registration
- Files:
  - `Editor/Services/Menu/ICosmosMenuService.cs`
  - `Editor/Services/Menu/CosmosMenuService.cs`
  - `Editor/Program.cs`

3. Commit 3: refactor main menu partial to model-driven rendering
- Files:
  - `Editor/Views/Shared/_CosmosMainMenuPartial.cshtml`
  - optional `Editor/Views/Shared/_Layout.cshtml`

4. Commit 4: add unit tests and rendering assertions
- Files:
  - `Tests/Editor/Services/Menu/CosmosMenuServiceTests.cs`
  - `Tests/Editor/Views/Shared/CosmosMainMenuPartialTests.cs`

5. Commit 5: polish and docs
- Files:
  - small updates from review feedback
  - optional documentation note updates

## PR Description Template

### Summary
Refactors main menu rendering to use a DI-backed menu composition service while preserving existing behavior and role visibility.

### Why
Creates the first safe seam for future module-contributed menu entries without introducing runtime module loading.

### Included

1. Menu models and composition service
2. DI registration in startup
3. Partial view rendering refactor
4. Regression tests for role visibility and key menu entries

### Not Included

1. Module upload/install
2. Module runtime loading
3. Module route registration

## Done Criteria

1. All existing tests pass.
2. New tests for menu composition pass.
3. Manual role matrix checks pass.
4. No behavior regressions reported in main menu and Edit dropdown.
5. No changes to host IMediator trust boundary.
