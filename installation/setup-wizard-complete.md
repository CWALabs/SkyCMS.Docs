<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/SetupWizard-Complete.md -->

# Setup Wizard Complete

## What to do next

1. Restart application services.
2. Sign in with administrator credentials.
3. Publish a test page and verify output.
4. Run checks in [post-installation.md](post-installation.md).

## Important setting

Ensure setup remains disabled after completion:

- `CosmosAllowSetup=false`

## If you need to rerun setup

Re-enabling setup on existing environments can overwrite or conflict with configuration. Use caution, back up data first, and re-enable only when necessary.

## Related guides

- [post-installation.md](post-installation.md)
- [setup-wizard.md](setup-wizard.md)
