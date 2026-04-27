<!-- Audience: DevOps -->
<!-- Type: How-to -->

# Deploy with Cloudflare

Cloudflare provides edge hosting, CDN caching, and static asset storage for SkyCMS. This guide covers R2 object storage for docs and media, CDN cache purging, and the automated documentation deployment pipeline.

---

## Architecture Overview

```
SkyCMS Editor ──► Cloudflare CDN ──► End Users
                       │
Azure Storage ◄────────┘ (origin pull)
                       │
Cloudflare R2 ◄────────┘ (direct R2 storage)
```

SkyCMS integrates with Cloudflare at three levels:

| Layer | Purpose | Configuration |
|-------|---------|---------------|
| **R2 Storage** | Host documentation static site and media assets | [R2 Configuration](../configuration/storage/cloudflare-r2.md) |
| **CDN Caching** | Cache and purge published content at the edge | [CDN Configuration](../configuration/cdn/cloudflare.md) |
| **Docs Pipeline** | Automated MkDocs build and deploy to R2 | `deploy-docs-cloudflare.yml` workflow |

---

## When to Use Cloudflare Edge Hosting

- You need global CDN distribution for published sites
- You want to host the documentation site on Cloudflare R2
- You need programmable cache purging when content changes
- You want DDoS protection and edge security in front of your origin

## Compliance and Licensing

- [Licensing and Distribution](./licensing-and-distribution.md)

---

## Required Secrets

Before deploying, configure these six secrets in your GitHub repository:

| Secret | Description |
|--------|-------------|
| `CLOUDFLARE_R2_ACCESS_KEY_ID` | R2 API access key |
| `CLOUDFLARE_R2_SECRET_ACCESS_KEY` | R2 API secret key |
| `CLOUDFLARE_ACCOUNT_ID` | Your Cloudflare account ID |
| `CLOUDFLARE_R2_BUCKET_NAME` | Target R2 bucket name |
| `CLOUDFLARE_ZONE_ID` | DNS zone for cache purging |
| `CLOUDFLARE_API_TOKEN` | API token with zone permissions |

> **Security:** Never commit secrets to source control. Use `UploadSecretsToGithubRepo.ps1` to sync local secrets to GitHub. Rotate tokens every 90 days and use minimum required permissions.

Credential setup guides:

- [Create a Cloudflare API Token for Cache Purge](../configuration/cdn/cloudflare-token-for-cache-purge.md)
- [Create Cloudflare R2 API Credentials](../configuration/storage/cloudflare-r2-api-credentials.md)

---

## R2 Storage Setup

Cloudflare R2 provides S3-compatible object storage without egress fees.

### Creating a Bucket

1. Log in to the Cloudflare dashboard
2. Navigate to **R2 Object Storage**
3. Create a new bucket (name must match `CLOUDFLARE_R2_BUCKET_NAME`)
4. Enable public access if serving static content directly

### Configuration

See [Cloudflare R2 Configuration](../configuration/storage/cloudflare-r2.md) for SkyCMS storage provider settings.

For the credential creation steps, use [Create Cloudflare R2 API Credentials](../configuration/storage/cloudflare-r2-api-credentials.md).

---

## CDN Cache Management

SkyCMS can purge Cloudflare's CDN cache when content is published or updated.

### How Purging Works

When an article is published, the CMS sends a cache purge request to Cloudflare's API targeting the specific URLs that changed. This ensures visitors see updated content immediately without waiting for TTL expiry.

### Configuration

See [Cloudflare CDN Configuration](../configuration/cdn/cloudflare.md) for purge API settings and cache rule configuration.

For the token creation steps, use [Create a Cloudflare API Token for Cache Purge](../configuration/cdn/cloudflare-token-for-cache-purge.md).

---

## Documentation Deployment Pipeline

The `deploy-docs-cloudflare.yml` GitHub Actions workflow automatically deploys documentation to R2:

### Trigger

Pushes to `Docs/**` paths on the default branch.

### Pipeline Steps

1. **Build** — Runs `mkdocs build` to generate the static documentation site
2. **Pre-deploy validation** — Checks for broken internal links
3. **Upload to R2** — Syncs built files to the R2 bucket
4. **Post-deploy validation** — Verifies links resolve correctly on the live site

### Concurrency

The workflow uses GitHub Actions concurrency controls to prevent overlapping deployments. If a new push arrives while a deployment is running, the in-progress deployment completes before the new one starts.

---

## Validation Checklist

After deploying, verify:

- [ ] Documentation site loads at the configured R2/CDN URL
- [ ] CSS and images render correctly
- [ ] Internal links resolve (check workflow logs for link validation results)
- [ ] CDN cache purge triggers when content is published in the editor
- [ ] R2 bucket permissions are not overly permissive
- [ ] API token has minimum required Cloudflare permissions

---

## See Also

- [R2 Storage Configuration](../configuration/storage/cloudflare-r2.md)
- [Create Cloudflare R2 API Credentials](../configuration/storage/cloudflare-r2-api-credentials.md)
- [CDN Configuration](../configuration/cdn/cloudflare.md)
- [Create a Cloudflare API Token for Cache Purge](../configuration/cdn/cloudflare-token-for-cache-purge.md)
- [CI/CD Pipelines](cicd-pipelines.md) — Full pipeline reference
- [Demo Deployment](demo-deployment.md) — One-command Azure demo
