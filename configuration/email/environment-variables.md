<!-- Audience: Developers and DevOps -->
<!-- Type: Reference -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-Environment-Variables.md -->

# Email Environment Variables

## When to use this page

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
