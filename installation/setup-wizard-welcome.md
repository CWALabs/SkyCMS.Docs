<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/SetupWizard-Welcome.md -->

# Setup Wizard: Welcome

## Purpose

The welcome screen validates prerequisites before entering the guided setup flow.

## Required before continuing

- `CosmosAllowSetup=true`
- Valid database connection string in `ConnectionStrings__ApplicationDbContextConnection`

## Common issues

- Redirect to home page: setup already completed or setup disabled.
- Setup not allowed: enable `CosmosAllowSetup` and restart.
- Database connection missing: provide required connection string.

## Next step

Proceed to [setup-wizard-step1-storage.md](setup-wizard-step1-storage.md).

## Related guides

- [setup-wizard.md](setup-wizard.md)
- [minimum-required-settings.md](minimum-required-settings.md)
