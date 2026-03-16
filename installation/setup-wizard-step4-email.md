<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/SetupWizard-Step4-Email.md -->

# Setup Wizard: Step 4 Email (Optional)

## Purpose

Configure transactional email delivery for account workflows and notifications.

## Provider options

- SendGrid
- Azure Communication Services
- SMTP
- None (development/testing)

## Key guidance

- Provide valid sender email and provider credentials.
- Run test send before moving forward.
- Keep secrets in secure secret stores or environment variables.

## Common issues

- Invalid API key or SMTP credentials.
- Sender identity not verified.
- Provider sandbox restrictions.

## Next step

Proceed to [setup-wizard-step5-cdn.md](setup-wizard-step5-cdn.md).

## Related guides

- [../configuration/email/overview.md](../configuration/email/overview.md)
- [../configuration/email/configuration-reference.md](../configuration/email/configuration-reference.md)
