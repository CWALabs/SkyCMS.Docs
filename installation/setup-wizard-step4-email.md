---
canonical_title: Setup Wizard Step 4 Email
description: Configure optional email delivery settings for account workflows and system notifications during setup.
doc_type: How-to
product_area: installation
user_intent: configure-email-during-setup
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard: Step 4 Email (Optional)

## Summary

Configure transactional email delivery for account workflows and notifications.

## Outcome

After completing this step, outbound email will be configured (or explicitly skipped) for account notifications and workflow emails.

## Steps

1. Select your email provider, or select **None** to skip email setup for now.
2. Enter the required credentials and verified sender address for your chosen provider.
3. Click **Test** to send a test email and confirm delivery.
4. Click **Continue** once delivery is confirmed, or skip intentionally by selecting **None**.

## Provider options

- SendGrid
- Azure Communication Services
- SMTP
- None (development/testing)

## Key guidance

- Provide valid sender email and provider credentials.
- Run test send before moving forward.
- Keep secrets in secure secret stores or environment variables.

## When to skip this step

Skip email during setup when you are validating locally, using a throwaway environment, or do not yet have verified sender credentials. You can configure email later without rerunning the full wizard.

## Common issues

- Invalid API key or SMTP credentials.
- Sender identity not verified.
- Provider sandbox restrictions.

## Verification

This step is complete when a test send succeeds or you intentionally choose to leave email unconfigured for the current environment.

## Next step

Proceed to [Setup Wizard: Step 5 CDN](setup-wizard-step5-cdn.md).

## Related guides

- [Email Overview](../configuration/email/overview.md)
- [Email Configuration Reference](../configuration/email/configuration-reference.md)
