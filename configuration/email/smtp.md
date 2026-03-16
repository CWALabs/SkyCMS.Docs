<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-SMTP.md -->

# Email: SMTP

## When to use SMTP

Use SMTP when integrating with an existing mail relay or provider that exposes authenticated SMTP endpoints.

## Required settings

- SMTP host,
- port,
- username and password,
- sender address,
- TLS/SSL mode.

## Example configuration

Configure values through environment variables for production environments and rotate credentials regularly.

## Testing email delivery

- test connection and send action in settings,
- verify TLS mode and firewall egress access,
- inspect server logs for authentication or relay errors.

## Related guides

- [Email Overview](./overview.md)
- [Email Configuration Reference](./configuration-reference.md)
