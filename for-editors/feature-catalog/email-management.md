---
canonical_title: Email Management
description: Concrete usage guide for SkyCMS email management, including provider choices, practical checks, and common workflows.
doc_type: How-to
product_area: email
user_intent: configure-and-verify-email
audience:
  - Administrators
  - Content Managers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Email Management

Use Email Management when you need to configure how SkyCMS sends messages such as contact notifications, account confirmation, and password reset email.

## What You Can Do

- Choose an email delivery provider
- Configure credentials and sender identity
- Test delivery from your environment
- Troubleshoot common send failures

## When to Use This Area

- Initial platform setup
- Environment changes (new domain, new credentials, provider migration)
- Ongoing operational checks and troubleshooting

## Main Controls and What They Do

| Control or Setting | What it does |
| --- | --- |
| Provider selection | Chooses which email service SkyCMS uses |
| Sender identity fields | Defines display name and from address |
| Credential fields | Stores API key, connection string, or SMTP credentials |
| Test send | Sends a verification email to validate configuration |
| Environment variable mapping | Lets you manage secrets outside source control |

## Common Tasks

### Configure email for the first time

1. Pick a provider (ACS, SendGrid, SMTP, or NoOp for local test).
2. Add provider credentials.
3. Set sender display name and from email.
4. Save settings.
5. Run test send and confirm delivery.

### Troubleshoot missing contact emails

1. Verify active provider and credentials.
2. Run test send.
3. Check spam/quarantine and sender policy setup.
4. Confirm contact notification settings are enabled.
5. Review environment variable overrides if behavior differs by environment.

## Related Deep References

- [Email Overview](../../configuration/email/overview.md)
- [Email Configuration Reference](../../configuration/email/configuration-reference.md)
- [Azure Communication Services](../../configuration/email/azure-communication-services.md)
- [SendGrid](../../configuration/email/sendgrid.md)
- [SMTP](../../configuration/email/smtp.md)
- [Contact Management](../../for-editors/contact-management.md)
- [Feature Catalog: Administration and Security](../../reference/features/06-administration-and-security.md)
