<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-None.md -->

# Email: No Provider

## When to use no provider

Use this mode when outbound email is intentionally disabled for local development, isolated test environments, or deployments that do not require notifications.

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
