---
canonical_title: Email: SendGrid
description: Configure SendGrid email delivery for SkyCMS using API-key-based transactional email.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-sendgrid-email
audience:
	- Developers
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Email: SendGrid

## Summary

Use SendGrid when you need managed transactional email delivery with API-key authentication.

## Outcome

After completing this guide, SkyCMS will deliver outbound email through SendGrid using the configured API key and verified sender identity.

## Required settings

- provider mode set to SendGrid,
- SendGrid API key,
- sender address and display name.

## Example configuration

Use environment variables or secret stores for API keys. Avoid storing keys in source-controlled settings files.

## Testing email delivery

- send a test message from settings,
- verify sender identity status,
- review provider dashboard logs for delivery and bounce events.

## Validation checklist

- test send succeeds,
- sender identity is verified,
- dashboard logs show acceptance and expected delivery behavior,
- no repeated auth or quota errors appear in runtime logs.

## Related guides

- [Email Overview](./overview.md)
- [SendGrid API Key](./sendgrid-api-key.md)
- [Email Configuration Reference](./configuration-reference.md)
