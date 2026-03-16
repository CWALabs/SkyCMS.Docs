<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/SetupWizard.md -->

# Setup Wizard Installation Guide

## When to use this page

Use this guide for first-time, single-tenant setup through the interactive UI.

## Prerequisites

- `CosmosAllowSetup=true`
- `ConnectionStrings__ApplicationDbContextConnection`
- Application deployed and reachable

## Start setup

Open:

- `https://<your-host>/___setup`

## Wizard steps

1. [setup-wizard-welcome.md](setup-wizard-welcome.md)
2. [setup-wizard-step1-storage.md](setup-wizard-step1-storage.md)
3. [setup-wizard-step2-admin.md](setup-wizard-step2-admin.md)
4. [setup-wizard-step3-publisher.md](setup-wizard-step3-publisher.md)
5. [setup-wizard-step4-email.md](setup-wizard-step4-email.md) (optional)
6. [setup-wizard-step5-cdn.md](setup-wizard-step5-cdn.md) (optional)
7. [setup-wizard-step6-review.md](setup-wizard-step6-review.md)
8. [setup-wizard-complete.md](setup-wizard-complete.md)

## Pre-configuration behavior

Values provided via environment variables are treated as source-of-truth and appear read-only or masked in the wizard.

## After completion

- Restart the application.
- Sign in with the created admin account.
- Run validation steps in [post-installation.md](post-installation.md).
- Set `CosmosAllowSetup=false`.

## Related guides

- [minimum-required-settings.md](minimum-required-settings.md)
- [post-installation.md](post-installation.md)
