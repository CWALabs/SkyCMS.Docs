<!-- Audience: DevOps -->
<!-- Type: How-to -->

# Create a Cloudflare API Token for Cache Purge

Use this guide when SkyCMS needs to purge cached pages from Cloudflare after publish.

## What SkyCMS needs

SkyCMS needs two values for Cloudflare CDN purge integration:

- `Zone ID`
- `API token` with `Zone -> Cache Purge` permission for the correct zone

For long-lived automation, prefer an account-owned token when your Cloudflare plan and target API support it. For personal setup or one-off testing, a user token is acceptable.

## Before you start

- Confirm the site's DNS zone is already managed in Cloudflare.
- Decide whether this token is for personal testing or durable automation.
- Plan to store the token in a secret store such as GitHub Actions secrets, Azure Key Vault, or a deployment secret manager.

## Step 1: Find the Zone ID

1. Sign in to the Cloudflare dashboard.
2. Open the zone for the site you want SkyCMS to purge.
3. Stay on the `Overview` page.
4. In the `API` section, copy the `Zone ID`.
5. Store it temporarily as the value you will later place in `CLOUDFLARE_ZONE_ID` or the equivalent SkyCMS setting.

If you have multiple Cloudflare accounts or multiple similar domains, double-check that the zone name matches the site SkyCMS is publishing.

## Step 2: Choose the token type

Choose one of these options:

- `Account-owned token`: best for CI/CD, production publishing, and team-managed integrations. This token is not tied to one employee's account. Creating it requires sufficient account privileges and, in many organizations, Super Administrator access.
- `User token`: acceptable for manual setup, local verification, and smaller teams. This token is tied to your user and may stop working if your user loses account access.

## Step 3: Open the token creation page

For a user token:

1. Open `My Profile`.
2. Open `API Tokens`.
3. Select `Create Token`.

For an account-owned token:

1. Open `Manage Account`.
2. Open `API Tokens`.
3. Select `Create Token`.

## Step 4: Create a custom token

1. Choose `Create Custom Token`.
2. Give the token a descriptive name such as `SkyCMS Cloudflare Purge - Production`.
3. In `Permissions`, set the first dropdown to `Zone`.
4. In `Permissions`, set the second dropdown to `Cache Purge`.
5. In `Permissions`, set the third dropdown to `Purge`.
6. In `Zone Resources`, set the first dropdown to `Include`.
7. In `Zone Resources`, set the second dropdown to `Specific zone`.
8. In `Zone Resources`, set the third dropdown to your target zone (for example, `sky-cms.com`).
9. Leave `Client IP Address Filtering` empty unless you have stable egress IPs for automation.

Do not grant `All zones` unless you have a strong operational reason and have reviewed the security impact.

## Step 5: Apply optional restrictions

Cloudflare allows extra restrictions such as token TTL and client IP filtering.

Recommended defaults:

- set an expiration date if your team rotates secrets regularly
- use IP filtering only if your automation runs from stable egress IPs
- avoid over-constraining the token until initial validation succeeds

## Step 6: Create and copy the token

1. Select `Continue to summary`.
2. Review the token name, permission, and zone scope.
3. Select `Create Token`.
4. Copy the token secret immediately.

Cloudflare only shows the token secret once. After leaving the completion screen, you cannot retrieve the same secret again.

## Step 7: Store the values in SkyCMS secrets

Store these two values:

- `CLOUDFLARE_ZONE_ID`
- `CLOUDFLARE_API_TOKEN`

For the documentation deployment workflow, these are the secrets used by [../../deployment/cloudflare.md](../../deployment/cloudflare.md).

## Step 8: Verify the token

Use Cloudflare's token verification endpoint before testing SkyCMS publishing.

```bash
curl "https://api.cloudflare.com/client/v4/user/tokens/verify" \
  --header "Authorization: Bearer <API_TOKEN>"
```

Successful verification should report the token as active.

## Step 9: Validate from SkyCMS

After saving the configuration in SkyCMS or your deployment secrets:

1. Run the save or test action for the CDN configuration if available.
2. Publish a page or article.
3. Confirm the publish completes.
4. Confirm Cloudflare receives the purge request and the updated content becomes visible.

## Common mistakes and tips

- Use `Authorization: Bearer <token>` with API tokens. Do not use the legacy email plus global API key syntax.
- `Invalid Zone ID` usually means the token is pointed at the wrong domain, not just that the value is malformed.
- If the token verifies but purge fails, the most likely cause is missing `Zone -> Cache Purge` permission or wrong zone scoping.
- Prefer account-owned tokens for shared environments and GitHub Actions.
- Use least privilege: one zone, one purpose, one secret store.
- Cloudflare purge operations are rate-limited. Single-file purge is usually the best default when your workflow knows which URLs changed.

## Related guides

- [Cloudflare CDN](./cloudflare.md)
- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
- [Deploy with Cloudflare](../../deployment/cloudflare.md)
