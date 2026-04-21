<!-- Audience: Administrators and Advanced Editors -->
<!-- Type: How-to / Reference -->
<!-- Status: Draft -->

# AI Provider Setup

## Overview

SkyCMS AI is no longer limited to Monaco inline assistance. The current tenant AI configuration powers:

- Monaco inline completions,
- Monaco AI chat,
- CKEditor page editor AI writing assistance,
- standalone AI Help Chat.

The feature is off by default and requires an administrator to configure the tenant AI provider before it becomes available to editors.

## Where to configure

Open **Settings -> AI Provider** in the SkyCMS administration panel.

The tenant-level provider settings apply to all editors in that tenant. When the provider supports it, editors can still choose their own preferred model inside Monaco, CKEditor, or AI Help Chat.

## Fields

### Enabled

Turns AI on or off for the tenant.

### Endpoint

The full URL of an OpenAI-compatible **chat completions** API endpoint.

Examples:

| Provider | Endpoint |
| --- | --- |
| GitHub Models | `https://models.inference.ai.azure.com/chat/completions` |
| OpenAI | `https://api.openai.com/v1/chat/completions` |
| Azure OpenAI | `https://<resource>.openai.azure.com/openai/deployments/<deployment>/chat/completions?api-version=2024-10-21` |
| Local (Ollama) | `http://localhost:11434/v1/chat/completions` |

### Model

Use `auto` when the provider supports SkyCMS-managed defaults.

Current behavior:

- GitHub Models: `auto` resolves to `gpt-4o-mini`
- OpenAI: `auto` resolves to `gpt-4o-mini`
- Azure OpenAI: SkyCMS typically infers the deployment from the configured endpoint

### Access Token

The secret sent to the upstream provider.

Current behavior:

- GitHub Models and OpenAI use bearer-token style auth,
- Azure OpenAI uses the `api-key` header.

### Timeout (ms)

How long SkyCMS waits for the upstream provider.

### Temperature

Controls randomness. Lower values usually work better for editing and code tasks.

### Discovered models

The settings page can preview provider model options before you save.

Current SkyCMS behavior:

- GitHub Models: live model catalog supported
- OpenAI: live model catalog supported
- Azure OpenAI: deployment inferred from the endpoint
- local servers and some advanced gateways: manual model entry may still be required

### Max Tokens

Limits how much text the provider can return in one response.

## Getting provider credentials

### GitHub Models token

1. Sign in at [github.com](https://github.com).
2. Open **Settings -> Developer settings -> Personal access tokens -> Fine-grained tokens**.
3. Generate a new token.
4. Grant **Models: Read** permission.
5. Paste the token into **Access Token** in SkyCMS AI Provider settings.

Official references:

- <https://docs.github.com/en/github-models/use-github-models/prototyping-with-ai-models>
- <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>

### OpenAI API key

1. Sign in to your OpenAI platform account.
2. Create a secret key from the API key page.
3. Paste it into **Access Token**.
4. Use the OpenAI endpoint and leave **Model** on `auto` unless you want to pin a specific model.

Official references:

- <https://platform.openai.com/api-keys>
- <https://help.openai.com/en/articles/4936850-where-do-i-find-my-openai-api-key>

### Azure OpenAI API key

1. Open your Azure OpenAI resource.
2. Copy the API key and endpoint.
3. Use the deployment-scoped chat completions endpoint in SkyCMS.
4. Keep **Model** on `auto` unless you need to pin a specific deployment name.

Official references:

- <https://learn.microsoft.com/en-us/azure/foundry/openai/reference>
- <https://learn.microsoft.com/en-us/azure/foundry-classic/openai/how-to/switching-endpoints>

## Expected behavior after setup

Once settings are saved with **Enabled** on and a valid endpoint/token:

1. Monaco can enable inline completions and AI chat.
2. CKEditor can enable its region-scoped AI assistant.
3. AI Help Chat can open from the editor menu.
4. If supported, model pickers can load live model options.

## Recommended next step

For the fuller provider guidance, use the dedicated configuration pages:

- [AI Configuration Overview](../configuration/ai/overview.md)
- [AI Provider Comparison](../configuration/ai/provider-comparison.md)
- [Possible Free AI Services](../configuration/ai/free-services.md)

## Related guides

- [Code Editor Basics](./code-editor.md)
- [AI Assistant](./ai-assistant.md)
- [AI Troubleshooting](./ai-troubleshooting.md)
- [AI Configuration Overview](../configuration/ai/overview.md)
