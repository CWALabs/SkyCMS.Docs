<!-- Audience: Developers and Administrators -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-Configuration-Reference.md -->

# Email Configuration Reference

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
