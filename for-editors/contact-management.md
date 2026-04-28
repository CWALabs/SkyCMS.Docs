---
canonical_title: Contact Management
description: View, export, and manage contact form submissions in the SkyCMS admin dashboard, including MailChimp integration.
doc_type: How-to
product_area: administration
user_intent: manage-contact-form-submissions
audience:
  - Administrators
  - Content Editors
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Contact management

## Summary

Use this guide when you need to:

- view contact form submissions,
- export submissions to CSV,
- configure MailChimp synchronization.

SkyCMS captures contact form submissions and provides tools for viewing, exporting, and syncing them to external services.

## Accessing contacts

Navigate to **Editor → Contacts** from the sidebar. Contact management is available to **Administrators** and **Editors**.

---

## Viewing submissions

The contacts page displays all form submissions in a data table with the following columns:

| Column | Description |
| ------ | ----------- |
| **Email** | Submitter's email address |
| **First Name** | Submitter's first name |
| **Last Name** | Submitter's last name |
| **Phone** | Phone number (if provided) |
| **Created** | Submission timestamp |
| **Updated** | Last update timestamp |

---

## Alert notifications

Toggle the **Enable Alerts** switch to control whether administrators receive email notifications when new contact form submissions arrive.

- **Enabled** — An email is sent to the configured admin address on each new submission.
- **Disabled** — Submissions are stored but no notification is sent.

---

## Exporting contacts

Click **Export to CSV** to download all contact submissions as a CSV file. The export includes all columns shown in the data table. This is useful for importing contacts into CRM or email marketing tools.

---

## MailChimp Integration

Connect SkyCMS to MailChimp for automatic contact list synchronization.

### Setting Up MailChimp

1. Navigate to **Contacts → MailChimp**.
2. Enter your MailChimp API key.
3. Enter the MailChimp list/audience name.
4. Click **Save**.

New contact form submissions will be automatically synced to your MailChimp audience.

### Removing MailChimp

Click **Remove MailChimp** to disconnect the integration and clear the stored API credentials.

---

## Contact Form API

The public-facing contact form submits data via:

```text
POST /_api/contact/submit
```

This endpoint is:

- **Rate limited:** 3 requests per 5 minutes in production, 20 per minute in development.
- **Anti-forgery protected:** Requires a valid anti-forgery token.
- **reCAPTCHA validated:** Optional CAPTCHA verification via `POST /_api/contact/captcha-validate`.

A JavaScript helper library is available at `/_api/contact/skycms-contact.js` with the anti-forgery token pre-embedded.

For full API details, see [Contact Form API (Developers)](../for-developers/api/contact-form.md).

---

## See Also

- [Contact Form API](../for-developers/api/contact-form.md) — Developer API reference
- [Contact Form Example](../for-developers/api/contact-form-example.md) — Implementation example
- [Email Configuration](../configuration/email/overview.md) — Email provider setup for alert delivery
