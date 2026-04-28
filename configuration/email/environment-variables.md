---
canonical_title: Email Environment Variables
description: Reference the common email-related environment variable groups used for SkyCMS deployment-time configuration.
doc_type: Reference
product_area: configuration
user_intent: find-email-environment-variable-groups-for-skycms
audience:
	- Developers
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Email Environment Variables

## Summary

Use this reference when configuring email settings via deployment-time environment variables.

## Common variable groups

### SMTP

- host,
- port,
- username,
- password,
- sender address.

### SendGrid

- API key,
- sender address.

### Azure Communication Services

- connection string,
- sender address.

## Notes

Variable names depend on your configured settings binding model. Keep credentials in secure secret providers and inject them at runtime.

## Related guides

- [Email Configuration Reference](./configuration-reference.md)
