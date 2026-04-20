<!-- Audience: Developers and Administrators -->
<!-- Type: Explanation -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/README.md -->

# Configuration Overview

## When to use this page

Use this page when you need to:

- choose configuration area and provider guides,
- understand where to place secrets and connection values,
- validate deployment-ready configuration.

## Configuration model

SkyCMS configuration is grouped into four operational categories:

- database,
- storage,
- CDN,
- email.

Cross-cutting topics include multi-tenancy and proxy settings.

## Configuration precedence

Recommended precedence model:

1. environment variables and secret stores,
2. environment-specific appsettings,
3. base appsettings defaults.

Do not keep production secrets in source-controlled files.

## Configuration guides

- [Database Overview](./database/overview.md)
- [Storage Overview](./storage/overview.md)
- [CDN Overview](./cdn/overview.md)
- [Email Overview](./email/overview.md)
- [Multi-Tenancy Configuration](./multi-tenancy.md)
- [Proxy Settings](./proxy-settings.md)

## Related guides

- [Configuration Reference by Area](../configuration/overview.md)
- [For Developers](../for-developers/index.md)
