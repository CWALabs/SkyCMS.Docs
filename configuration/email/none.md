---
canonical_title: Email: No Provider
description: Disable outbound email for local, isolated, or notification-free SkyCMS environments.
doc_type: How-to
product_area: configuration
user_intent: disable-outbound-email-in-skycms
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Email: No Provider

## Summary

Use this mode when outbound email is intentionally disabled for local development, isolated test environments, or deployments that do not require notifications.

## Outcome

After completing this guide, SkyCMS will run without outbound email delivery, and workflows that depend on email will continue without sending.

## Steps

1. Navigate to **Settings → Email** in the SkyCMS admin panel.
2. Select **None** as the provider.
3. Click **Save** to disable outbound email.
4. Verify that email-dependent workflows continue running without delivery errors in application logs.

## Behavior

- no provider send calls are executed,
- workflow paths that depend on email continue without outbound delivery,
- test scenarios can focus on application behavior without external mail dependencies.

## Cautions

- production workflows may silently miss expected notifications,
- document this mode clearly for operators and support teams.

## Related guides

- [Email Overview](./overview.md)
- [Email Configuration Reference](./configuration-reference.md)
