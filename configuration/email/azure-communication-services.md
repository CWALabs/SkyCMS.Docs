<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-AzureCommunicationServices.md -->

# Email: Azure Communication Services

## When to use ACS email

Use Azure Communication Services when you want Azure-managed email delivery and centralized Azure operations.

## Required settings

- ACS connection string,
- verified sender domain/address,
- provider mode set to Azure Communication Services.

## Example configuration

Store the ACS connection string in secret stores and inject it via environment variables at runtime.

## Testing email delivery

- run send test from settings,
- verify sender identity status in ACS,
- check ACS diagnostics for throttling or authentication failures.

## Related guides

- [Email Overview](./overview.md)
- [Azure Communication Services Credentials](./azure-communication-services-credentials.md)
- [Email Configuration Reference](./configuration-reference.md)
