# Module Lifecycle State Machine

## Objective
Define predictable module behavior from upload to removal, including failure handling and rollback.

## States

1. `Uploaded`
- Package received and stored temporarily.

2. `Validated`
- Signature, manifest schema, compatibility, and file integrity checks passed.

3. `Installed`
- Files extracted to module storage and metadata persisted.
- Module is not active yet.

4. `Disabled`
- Installed but not active for runtime/menu/routes.

5. `Enabling`
- Dependency checks and runtime registration in progress.

6. `Enabled`
- Module active, routes/menu/assets available according to policy.

7. `Degraded`
- Module enabled but failing health checks or partial initialization.

8. `Quarantined`
- Module forcibly isolated due to repeated failures or policy issues.

9. `Updating`
- Replacement package being validated and switched.

10. `Uninstalling`
- Module data and files being removed.

11. `Uninstalled`
- Module fully removed.

12. `Failed`
- Terminal action failure requiring admin intervention.

## Transitions

1. Upload path
- `Uploaded -> Validated -> Installed -> Disabled`

2. Activation path
- `Disabled -> Enabling -> Enabled`
- `Enabling -> Failed` on initialization or dependency errors

3. Runtime health path
- `Enabled -> Degraded` on threshold breach
- `Degraded -> Enabled` on recovery
- `Degraded -> Quarantined` on sustained failures

4. Update path
- `Enabled -> Updating -> Enabled` (new version)
- `Updating -> Failed` then rollback to previous version

5. Deactivation path
- `Enabled -> Disabled`
- `Degraded -> Disabled`

6. Removal path
- `Disabled -> Uninstalling -> Uninstalled`
- `Uninstalling -> Failed` on cleanup errors

## Guard Conditions

1. Only administrators can execute lifecycle transitions.
2. `Enable` requires compatibility and dependency satisfaction.
3. `Uninstall` requires module not currently enabled.
4. Quarantined modules cannot be enabled until admin clears quarantine.

## Events and Auditing

Every transition emits:

1. `ModuleLifecycleEvent`
- module id, version, tenant scope, action, actor, timestamp, result

2. `ModuleAuditLog`
- details and correlated request id

3. Optional notifications
- warning on `Degraded`, critical on `Quarantined`

## Failure and Rollback Policy

1. Install failure
- Remove partial extraction artifacts.
- Persist failure reason and diagnostics.

2. Enable failure
- Roll back runtime registration and menu contributions.
- Return to `Disabled` if rollback succeeds, else `Failed`.

3. Update failure
- Keep previous stable version active.
- Mark attempted update `Failed` and surface diagnostics.
