---
canonical_title: Setup Wizard Step 6 Review and Complete
description: Review the selected SkyCMS settings and finalize initial setup.
doc_type: How-to
product_area: installation
user_intent: review-and-finalize-the-setup-wizard
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard: Step 6 Review and Complete

## Summary

Review all selected settings and finalize setup.

## Outcome

After completing this step, the initial configuration will be persisted, the administrator account created, and setup locked down — leaving SkyCMS ready for first use.

## Steps

1. Review the configuration summary for each section: storage, publisher URL, email, and CDN.
2. Verify all values are correct before proceeding.
3. Click **Finalize** to persist the configuration and initialize SkyCMS.
4. Wait for the confirmation screen before closing the browser window.
5. Proceed to post-installation steps shown on the completion screen.

## What finalize does

- Persists configuration.
- Creates administrator account and roles.
- Initializes required data structures.
- Disables setup flow until explicitly re-enabled.

## Before finalizing

- Recheck storage and publisher values.
- Confirm optional email/CDN values if entered.
- Confirm admin email and password policy compliance.

## What to expect

Finalization writes the selected configuration, provisions initial application data, and closes the setup path until you explicitly enable it again.

## Common issues

- Finalize errors due to invalid credentials or unavailable resources.
- Setup remains enabled because of environment-variable override.

## Verification

This step is complete when finalization succeeds without an application error and the wizard advances to the completion screen.

## Next step

Proceed to [Setup Wizard Complete](setup-wizard-complete.md).

## Related guides

- [Post-Installation Configuration](post-installation.md)
- [Minimum Required Settings](minimum-required-settings.md)
