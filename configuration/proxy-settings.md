<!-- Audience: Developers and Administrators -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/ProxySettings.md -->

# Proxy Settings

## When to use this page

Use this guide when SkyCMS runs behind reverse proxies, load balancers, or edge gateways.

## Common proxy requirements

- preserve host and scheme headers,
- forward client IP headers,
- enforce HTTPS forwarding behavior,
- keep origin and proxy path assumptions consistent.

## Recommended checks

1. Confirm forwarded headers are enabled correctly.
2. Verify generated URLs use expected host/scheme.
3. Validate authentication callbacks and redirects behind proxy.
4. Confirm tenant/domain resolution still maps correctly.

## Troubleshooting

- wrong redirect scheme: verify X-Forwarded-Proto handling,
- wrong host in links: verify forwarded host header behavior,
- tenant mismatch behind proxy: verify canonical host forwarding.

## Related guides

- [Configuration Overview](./overview.md)
- [Multi-Tenancy Configuration](./multi-tenancy.md)
