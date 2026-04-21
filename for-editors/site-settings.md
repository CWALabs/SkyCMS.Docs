# Site Settings

Guide to configuring site-level settings from the SkyCMS admin dashboard.

**Audience:** Administrators

---

## Accessing Site Settings

Navigate to **Editor → Settings** from the sidebar. Site settings are restricted to users with the **Administrator** role.

---

## General Editor Settings

The main settings page controls core editor behavior:

| Setting | Description |
|---------|-------------|
| **Allow Setup** | Enable/disable the setup wizard. Should be turned off in production. Read-only in multi-tenant mode. |
| **Static Web Pages** | Toggle between dynamic rendering (server-side) and static site mode (pre-generated HTML). |
| **Requires Authentication** | When enabled, the published site requires user authentication to access. |
| **Publisher URL** | The public-facing website URL (e.g., `https://www.example.com`). |
| **Blob Public URL** | CDN or storage URL for serving static assets (images, CSS, JS). |

Click **Save** to apply changes. Some settings may require an application restart to take effect.

---

## CDN Configuration

Navigate to **Settings → CDN** to configure content delivery network integration. SkyCMS supports four CDN providers, configured one at a time.

### Cloudflare

| Field | Description |
|-------|-------------|
| **API Token** | Cloudflare API token with Zone:Cache Purge permissions |
| **Zone ID** | Your Cloudflare zone identifier |

### Azure CDN / Azure Front Door

| Field | Description |
|-------|-------------|
| **Is Azure Front Door** | Toggle: select Azure CDN or Azure Front Door |
| **Subscription ID** | Azure subscription GUID |
| **Resource Group** | Azure resource group name |
| **Profile Name** | CDN profile or Front Door name |
| **Endpoint Name** | CDN endpoint or Front Door endpoint |

### Amazon CloudFront

| Field | Description |
|-------|-------------|
| **Distribution ID** | CloudFront distribution identifier |
| **Access Key ID** | AWS IAM access key |
| **Secret Access Key** | AWS IAM secret key |
| **Region** | AWS region (dropdown: us-east-1, eu-west-1, ap-northeast-1, etc.) |

### Sucuri

| Field | Description |
|-------|-------------|
| **API Key** | Sucuri API key |
| **API Secret** | Sucuri API secret |

### CDN Actions

- **Test Connection** — Verify that the configured CDN credentials are valid.
- **Remove** — Clear all CDN settings. Publishing will continue without CDN cache purge.

> **Note:** CDN cache purge happens automatically on content publish. If the purge fails, publishing still completes — the failure is logged but does not block content delivery.

---

## AI Provider Configuration

Navigate to **Settings -> AI Provider** to configure the tenant AI integration used by Monaco, CKEditor, and AI Help Chat.

### Provider Presets

Select a preset to auto-fill endpoint and model settings:

| Preset | Endpoint | Description |
|--------|----------|-------------|
| **Custom** | User-provided | Any OpenAI-compatible API |
| **GitHub Models** | `https://models.inference.ai.azure.com/chat/completions` | GitHub Models API |
| **OpenAI** | `https://api.openai.com/v1/chat/completions` | OpenAI direct API |
| **Azure OpenAI** | User-provided | Azure OpenAI deployment endpoint |

### Settings

| Field | Range | Description |
|-------|-------|-------------|
| **Enabled** | on/off | Toggle AI availability for the tenant |
| **Endpoint URL** | URL | Chat completions API endpoint |
| **Model** | text | Model or deployment identifier |
| **Access Token** | text | API key or token (stored encrypted in settings table) |
| **Timeout** | 1000–60000 ms | Request timeout in milliseconds |
| **Temperature** | 0–2 | Creativity parameter (lower = more deterministic) |
| **Max Tokens** | 16–1024 | Maximum response length |

### Actions

- **Save** — Apply AI provider settings.
- **Remove** — Disable and clear all AI provider settings.

> **Tip:** Settings are per-tenant in multi-tenant deployments. Each site can have its own AI provider configuration.

---

## Settings Storage

Settings are stored in the application database under a group key (e.g., `EDITORSETTINGS`). In multi-tenant deployments, settings are isolated per tenant. Settings can be overridden by environment variables at deployment time.

---

## See Also

- [Configuration Overview](../configuration/overview.md) — Full configuration reference
- [CDN Overview](../configuration/cdn/overview.md) — Detailed CDN provider setup
- [AI Provider Setup](ai-provider-setup.md) — AI setup guide
- [AI Assistant](ai-assistant.md) — editor-facing AI usage guide
- [Proxy Settings](../configuration/proxy-settings.md) — Reverse proxy and CDN header configuration
