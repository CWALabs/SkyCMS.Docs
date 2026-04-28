---
canonical_title: Email: SMTP
description: Configure SMTP email delivery for SkyCMS notifications and workflow emails.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-smtp-email
audience:
	- Developers
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Email: SMTP

## Summary

Use SMTP when integrating with an existing mail relay or provider that exposes authenticated SMTP endpoints.

## Outcome

After completing this guide, SkyCMS will deliver outbound email through the configured SMTP relay using the supplied host, port, and authentication settings.

## Required settings

- SMTP host,
- port,
- username and password,
- sender address,
- TLS or SSL mode.

## Example configuration

Configure values through environment variables for production environments and rotate credentials regularly.

## Testing email delivery

- test connection and send action in settings,
- verify TLS mode and firewall egress access,
- inspect server logs for authentication or relay errors.

## Validation checklist

- test email sends successfully,
- sender address is accepted,
- TLS and auth mode match provider requirements,
- runtime logs show no repeated relay or auth failures.

## Related guides

- [Email Overview](./overview.md)
- [Email Configuration Reference](./configuration-reference.md)
