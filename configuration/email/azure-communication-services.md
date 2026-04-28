---
canonical_title: Email: Azure Communication Services
description: Configure Azure Communication Services email delivery for SkyCMS in Azure-managed environments.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-azure-communication-services-email
audience:
	- Developers
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Email: Azure Communication Services

## Summary

Use Azure Communication Services when you want Azure-managed email delivery and centralized Azure operations.

## Outcome

After completing this guide, SkyCMS will deliver outbound email through Azure Communication Services using the configured connection string and verified sender identity.

## Required settings

- ACS connection string,
- verified sender domain or address,
- provider mode set to Azure Communication Services.

## Example configuration

Store the ACS connection string in secret stores and inject it via environment variables at runtime.

## Testing email delivery

- run send test from settings,
- verify sender identity status in ACS,
- check ACS diagnostics for throttling or authentication failures.

## Validation checklist

- test send succeeds,
- sender identity is verified,
- ACS diagnostics show acceptance of messages,
- no repeated throttling or auth errors appear in runtime logs.

## Related guides

- [Email Overview](./overview.md)
- [Azure Communication Services Credentials](./azure-communication-services-credentials.md)
- [Email Configuration Reference](./configuration-reference.md)
