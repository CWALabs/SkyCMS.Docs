<!-- Audience: Developers and Administrators -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-Overview.md -->

# Email Overview

## When to use this page

Use this guide when choosing an email delivery provider for SkyCMS notifications and workflow emails.

## Supported modes

- SMTP,
- SendGrid,
- Azure Communication Services,
- none (disable outbound email).

## Provider selection

- use existing organization-standard provider where possible,
- keep credentials in secret stores,
- test delivery and sender identity before production go-live.

## Related guides

- [Email Configuration Reference](./configuration-reference.md)
- [SMTP](./smtp.md)
- [SendGrid](./sendgrid.md)
- [Azure Communication Services](./azure-communication-services.md)
- [No Email Provider](./none.md)
