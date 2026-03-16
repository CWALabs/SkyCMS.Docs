<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/Post-Installation.md -->

# Post-Installation Configuration

## When to use this page

Use this guide immediately after setup is complete to validate your deployment and harden production settings.

## Verification checklist

- Application restarts successfully after setup.
- Admin account can sign in.
- File upload works.
- Publisher URL is reachable.
- First page publish succeeds.
- Email test passes (if configured).
- CDN purge works (if configured).

## First publish test

1. Create a simple page.
2. Publish the page.
3. Open the expected URL on your public site.
4. Confirm content and linked assets load correctly.

## Security hardening

- Rotate and protect credentials.
- Restrict allowed upload file types to required formats.
- Create least-privilege non-admin accounts for day-to-day editing.
- Ensure HTTPS is enforced on public endpoints.
- Disable setup by ensuring `CosmosAllowSetup=false`.

## Operational checks

- Confirm logs are available and monitored.
- Validate backup/restore strategy for database and storage.
- Document runbook steps for cache purge and incident response.

## Related guides

- [setup-wizard.md](setup-wizard.md)
- [minimum-required-settings.md](minimum-required-settings.md)
- [../configuration/email/overview.md](../configuration/email/overview.md)
- [../configuration/cdn/overview.md](../configuration/cdn/overview.md)
- [../configuration/storage/overview.md](../configuration/storage/overview.md)
