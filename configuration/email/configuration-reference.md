---
canonical_title: Email Configuration Reference
description: Reference for SkyCMS email provider settings, credential requirements, and validation checks.
doc_type: Reference
product_area: configuration
user_intent: find-email-provider-settings-and-credentials
audience:
	- Developers
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Email Configuration Reference

## Summary

Use this page for exact email provider settings and validation requirements before enabling outbound email in production.

## Core settings

- provider type/mode,
- sender address,
- sender display name,
- provider credentials.

## Provider-specific credentials

### SMTP

- host,
- port,
- username/password,
- SSL/TLS mode.

### SendGrid

- API key.

### Azure Communication Services

- ACS connection string.

## Validation checklist

- send test succeeds,
- sender identity/domain is verified,
- delivery logs show acceptance by provider.

## Related guides

- [Email Overview](./overview.md)
- [Environment Variables](./environment-variables.md)
