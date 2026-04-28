---
canonical_title: Setup Wizard Complete
description: Confirm the setup wizard has finished cleanly and complete the immediate post-setup checks.
doc_type: How-to
product_area: installation
user_intent: finish-setup-and-run-initial-verification
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard Complete

## Summary

The wizard has finished writing the initial configuration. Your next job is to confirm the environment is usable, setup is locked down again, and first publish succeeds.

## What to do next

1. Restart application services.
2. Sign in with administrator credentials.
3. Publish a test page and verify output.
4. Run checks in [Post-Installation Configuration](post-installation.md).

## Important setting

Ensure setup remains disabled after completion:

- `CosmosAllowSetup=false`

## Verification

Setup is fully complete when:

- the application restarts cleanly,
- administrator sign-in works,
- a test publish succeeds,
- `CosmosAllowSetup` is no longer left enabled for the environment.

## If you need to rerun setup

Re-enabling setup on existing environments can overwrite or conflict with configuration. Use caution, back up data first, and re-enable only when necessary.

## Related guides

- [Post-Installation Configuration](post-installation.md)
- [Setup Wizard](setup-wizard.md)
