---
canonical_title: Email Overview
description: Choose and configure an email delivery mode for SkyCMS notifications and workflow messages.
doc_type: Explanation
product_area: configuration
user_intent: choose-and-configure-skycms-email
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

# Email Overview

## Summary

Use this page to select an email delivery approach and validate outbound email behavior in your environment.

## Supported modes

- SMTP
- SendGrid
- Azure Communication Services
- none (disable outbound email)

## Provider selection guidance

| Scenario | Recommended mode |
| --- | --- |
| Existing enterprise mail relay | SMTP |
| API-based transactional mail | SendGrid |
| Azure-native communication stack | Azure Communication Services |
| No email requirement | none |

## Setup sequence

1. Select provider aligned with organizational standards.
2. Configure credentials in secure configuration stores.
3. Configure sender identity and routing values.
4. Run delivery test from a non-production mailbox.
5. Validate workflow emails in target environment.

## Validation checklist

- the test email sends successfully,
- the sender identity is accepted by the provider,
- workflow notifications arrive as expected,
- no persistent auth or quota errors appear in logs.

## Related guides

- [Email Configuration Reference](./configuration-reference.md)
- [SMTP](./smtp.md)
- [SendGrid](./sendgrid.md)
- [Azure Communication Services](./azure-communication-services.md)
- [No Email Provider](./none.md)
- [Post-Installation Configuration](../../installation/post-installation.md)
