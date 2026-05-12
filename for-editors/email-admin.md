---
canonical_title: Email Admin
description: Use the SkyCMS Email Admin panel to test outgoing email configuration and verify delivery.
doc_type: How-to
product_area: administration
user_intent: test-and-verify-email-configuration
audience:
  - Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Email Admin

The **Email Admin** panel lets administrators test the outgoing email configuration for a SkyCMS tenant. Use it to verify that notification, contact-form, and system emails are being sent correctly.

For configuring email settings (SMTP, provider keys, sender address), see [Email Configuration Overview](../configuration/email/overview.md).

## Opening Email Admin

Go to **Editor → Email Admin** in the sidebar or top navigation. This section is only visible to users with the Administrator role.

## Sending a Test Email

1. Open Email Admin.
2. Enter a **recipient email address** you have access to.
3. Click **Send Test Email**.
4. Check the inbox for the recipient address.

A successful test email confirms that:

- The SMTP/email provider settings are correctly configured
- The sending domain is authorized
- The application can reach the mail server

## Troubleshooting Failed Test Sends

**No email received.**
Check that the recipient address is correct and not filtered to spam. Then verify:

- SMTP server, port, and authentication credentials in [Site Settings](site-settings.md)
- Firewall or network rules that may block outbound connections on the SMTP port (usually 587 or 465)

**Error message on send.**
The error message will indicate the failure type (authentication error, connection refused, etc.). Cross-reference with your email provider's documentation or contact your hosting administrator.

**Email received but shows wrong sender.**
Check the **From Address** and **From Name** fields in the email settings section of [Site Settings](site-settings.md).

## Related Guides

- [Email Configuration Overview](../configuration/email/overview.md) — set up your email provider
- [Site Settings](site-settings.md) — general settings including sender address
- [Contact Management](contact-management.md) — manage contact form submissions
