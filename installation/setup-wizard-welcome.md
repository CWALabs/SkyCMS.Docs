---
canonical_title: Setup Wizard Welcome
description: Confirm prerequisites before entering the guided SkyCMS setup flow.
doc_type: How-to
product_area: installation
user_intent: validate-setup-prerequisites-before-starting-the-wizard
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard: Welcome

## Summary

The welcome screen validates prerequisites before entering the guided setup flow.

## Outcome

After completing this step, you will have confirmed that setup is enabled and the database is reachable, and you can proceed to Step 1.

## Steps

1. Confirm `CosmosAllowSetup=true` is set in your environment configuration.
2. Confirm a valid database connection string is present in `ConnectionStrings__ApplicationDbContextConnection`.
3. Navigate to `/___setup` on your SkyCMS site to open the wizard.
4. Click **Continue** when all prerequisite checks pass.

## Before you continue

- `CosmosAllowSetup=true`
- Valid database connection string in `ConnectionStrings__ApplicationDbContextConnection`

## What to confirm on this screen

- setup is still enabled for this environment,
- the application can connect to the configured database,
- you are ready to move through the remaining setup steps in one session.

## Common issues

- Redirect to home page: setup already completed or setup disabled.
- Setup not allowed: enable `CosmosAllowSetup` and restart.
- Database connection missing: provide required connection string.

## Verification

This step is complete when the wizard allows you to continue to storage configuration without an access or prerequisite error.

## Next step

Proceed to [Setup Wizard: Step 1 Storage](setup-wizard-step1-storage.md).

## Related guides

- [Setup Wizard](setup-wizard.md)
- [Minimum Required Settings](minimum-required-settings.md)
