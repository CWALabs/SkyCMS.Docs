---
canonical_title: Setup Wizard Installation Guide
description: Complete first-time single-tenant SkyCMS setup through the interactive setup wizard.
doc_type: How-to
product_area: installation
user_intent: complete-skycms-first-time-setup-with-wizard
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard Installation Guide

## Summary

Use this guide for first-time, single-tenant setup through the interactive UI.

## Prerequisites

- `CosmosAllowSetup=true`
- `ConnectionStrings__ApplicationDbContextConnection`
- Application deployed and reachable

## Outcome

After completing this flow, you should be able to sign in with the created admin account and proceed to post-install validation.

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
- Run validation steps in [Post-Installation Configuration](post-installation.md).
- Set `CosmosAllowSetup=false`.

## Related guides

- [Minimum Required Settings](minimum-required-settings.md)
- [Post-Installation Configuration](post-installation.md)
