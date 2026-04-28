---
canonical_title: Post-Installation Configuration
description: Validate your SkyCMS installation and apply baseline security and operations hardening before production usage.
doc_type: How-to
product_area: installation
user_intent: verify-and-harden-skycms-after-setup
audience:
  - Developers
  - Administrators
  - DevOps
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Post-Installation Configuration

## Summary

Use this guide immediately after setup to verify functionality and establish a safe operational baseline.

## Outcome

After completing this page, your environment should be ready for controlled team usage with clear verification evidence.

## Verification checklist

Confirm that all checks pass:

1. Application restarts cleanly after setup.
2. Admin account sign-in works.
3. File upload succeeds.
4. Publisher URL responds.
5. First test page publish succeeds.
6. Email test succeeds if email is configured.
7. CDN purge works if CDN is configured.

## First publish validation

1. Create a simple page with text and one media asset.
2. Publish the page.
3. Open the expected public URL.
4. Confirm page content and linked assets are served correctly.

## Security hardening baseline

1. Confirm setup is disabled: `CosmosAllowSetup=false`.
2. Rotate setup-time credentials where applicable.
3. Apply least-privilege user roles for day-to-day editors.
4. Enforce HTTPS on public and admin entry points.
5. Restrict allowed upload types to required formats.

## Operational readiness checks

1. Confirm logs are available and retained.
2. Confirm database and storage backup strategy is defined and testable.
3. Confirm cache/CDN purge runbook steps are documented.
4. Confirm incident escalation and ownership are clear.

## Next steps

Move to deployment and release maturity:

- [Deployment Overview](../deployment/overview.md)
- [Publishing Workflow](../deployment/publishing-workflow.md)
- [CI/CD Pipelines](../deployment/cicd-pipelines.md)

## Related links

- [Setup Wizard](setup-wizard.md)
- [Minimum Required Settings](minimum-required-settings.md)
- [Configuration Overview](../configuration/overview.md)
- [Email Overview](../configuration/email/overview.md)
- [CDN Overview](../configuration/cdn/overview.md)
- [Storage Overview](../configuration/storage/overview.md)
