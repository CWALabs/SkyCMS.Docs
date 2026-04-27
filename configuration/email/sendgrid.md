<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/Email-SendGrid.md -->

# Email: SendGrid

## When to use SendGrid

Use SendGrid when you need managed transactional email delivery with API-key authentication.

## Required settings

- provider mode set to SendGrid,
- SendGrid API key,
- sender address and display name.

## Example configuration

Use environment variables or secret stores for API keys. Avoid storing keys in source-controlled settings files.

## Testing email delivery

- send a test message from settings,
- verify sender identity status,
- review provider dashboard logs for delivery and bounce events.

## Related guides

- [Email Overview](./overview.md)
- [SendGrid API Key](./sendgrid-api-key.md)
- [Email Configuration Reference](./configuration-reference.md)
