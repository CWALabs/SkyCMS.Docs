<!-- Audience: Administrators and Developers -->
<!-- Type: How-to / Reference -->
<!-- Status: Draft -->

# AI Configuration Overview

## When to use this page

Use this guide when you need to:

- enable SkyCMS AI features for a tenant,
- choose an AI provider,
- obtain an API key or token,
- understand how model discovery and model selection work in SkyCMS.

## What SkyCMS AI currently includes

SkyCMS now uses one tenant-aware AI configuration for multiple editor experiences:

- Monaco code editor inline completions,
- Monaco code editor AI chat,
- CKEditor page editor region-scoped AI writing assistance,
- standalone AI Help Chat opened from the editor menu.

The current implementation is centered on a shared AI proxy and provider metadata layer. Administrators configure the provider once per tenant, then editors can use the configured provider across supported editing surfaces.

## Where to configure AI

Open **Settings -> AI Provider** in the SkyCMS editor/admin UI.

The provider settings are tenant-scoped. In practice, that means:

- each tenant can use a different provider or endpoint,
- the main provider settings are shared by editors in that tenant,
- individual editors can still have their own saved model preference when the provider supports user model selection.

## Core fields

### Enabled

Turns the AI features on or off for the tenant.

If disabled, the code editor, page editor AI tools, and AI Help Chat will all report that AI is unavailable.

### Endpoint

The upstream **OpenAI-compatible chat completions endpoint** SkyCMS will call.

Common examples:

| Provider | Example endpoint |
| --- | --- |
| GitHub Models | `https://models.inference.ai.azure.com/chat/completions` |
| OpenAI | `https://api.openai.com/v1/chat/completions` |
| Azure OpenAI | `https://<resource>.openai.azure.com/openai/deployments/<deployment>/chat/completions?api-version=2024-10-21` |
| Ollama | `http://localhost:11434/v1/chat/completions` |

SkyCMS works best with providers that expose an OpenAI-compatible chat completions API.

### Model

The configured model value for the provider.

SkyCMS supports `auto` for providers where a safe default is known.

Current behavior:

- GitHub Models: `auto` resolves to `gpt-4o-mini`
- OpenAI: `auto` resolves to `gpt-4o-mini`
- Azure OpenAI: SkyCMS usually infers the deployment name from the endpoint URL

Important Azure note:

- Azure OpenAI uses **deployment names**, not raw model family names, in the request path and model selection flow.

### Access Token

The secret used to authenticate SkyCMS to the provider.

SkyCMS uses it like this:

- `Authorization: Bearer <token>` for OpenAI-compatible bearer-token providers such as GitHub Models and OpenAI,
- `api-key: <key>` for Azure OpenAI deployment endpoints.

Treat this value like a password.

### Timeout (ms)

How long SkyCMS waits for the upstream provider before timing out.

Useful guidance:

- keep this lower for fast hosted APIs,
- raise it for local inference servers that may cold-start more slowly.

### Temperature

Controls randomness.

SkyCMS defaults are intentionally conservative because most editing and coding tasks benefit from predictable output.

### Max Tokens

Limits how much text the provider can return in a single response.

Lower values typically reduce cost and latency.

## Model discovery in SkyCMS

SkyCMS can preview model options before you save the provider settings.

The **Discovered models** control uses the current form values and attempts to classify the provider state.

Current discovery states:

- `live-catalog`: SkyCMS loaded the model list from the provider
- `inferred`: SkyCMS inferred the effective model from the endpoint
- `needs-additional-configuration`: the provider may work, but SkyCMS needs more metadata than the current form provides for discovery
- `unsupported`: SkyCMS does not currently support discovery for that provider type
- `failed`: discovery was attempted but the provider call failed

Current provider behavior:

| Provider pattern | Discovery behavior |
| --- | --- |
| GitHub Models | Live catalog and user model selection are supported |
| OpenAI | Live catalog and user model selection are supported |
| Azure OpenAI | Deployment is inferred from the endpoint; live deployment listing is not currently exposed in SkyCMS |
| Azure AI Foundry model inference endpoints | May work as compatible endpoints, but SkyCMS currently reports that additional configuration is needed for discovery |
| Local OpenAI-compatible servers | Discovery usually unsupported; enter the model manually |

## Per-user model selection

When the provider supports it, SkyCMS lets editors choose a model from inside the editor UI.

That selection is:

- saved per user,
- scoped by provider,
- scoped by editor context such as Monaco, CKEditor, or Help Chat.

This means one editor can prefer a lighter/faster model while another editor keeps the tenant default.

## Provider quick starts

### GitHub Models

Best when you want the easiest hosted setup and a free experimentation path.

1. Go to GitHub account settings.
2. Create a fine-grained personal access token.
3. Grant **Models: Read** permission.
4. In SkyCMS, choose the GitHub Models preset or set:
   - Endpoint: `https://models.inference.ai.azure.com/chat/completions`
   - Model: `auto`
   - Access Token: your GitHub PAT
5. Save, then use **Load models** to preview the catalog.

Official references:

- GitHub Models free experimentation: <https://docs.github.com/en/github-models/use-github-models/prototyping-with-ai-models>
- GitHub PAT creation and permissions: <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>

Notes:

- GitHub documents free playground and API experimentation, but rate limits apply and can change.
- Fine-grained PATs should use the smallest permissions possible.

### OpenAI

Best when you want a straightforward commercial hosted API with live model catalog support.

1. Create or sign in to your OpenAI platform account.
2. Generate an API key from the OpenAI API key page.
3. In SkyCMS, choose the OpenAI preset or set:
   - Endpoint: `https://api.openai.com/v1/chat/completions`
   - Model: `auto`
   - Access Token: your OpenAI API key
4. Save, then use **Load models** to preview the catalog.

Official references:

- API keys: <https://platform.openai.com/api-keys>
- OpenAI key help article: <https://help.openai.com/en/articles/4936850-where-do-i-find-my-openai-api-key>

### Azure OpenAI

Best when you want Azure billing, Azure governance, and deployment-scoped model control.

1. Create or open an Azure OpenAI resource.
2. Deploy a model in that resource.
3. Copy the deployment-scoped endpoint and API key.
4. In SkyCMS, use the Azure AI preset and confirm the values:
   - Endpoint: `https://<resource>.openai.azure.com/openai/deployments/<deployment>/chat/completions?api-version=2024-10-21`
   - Model: usually `auto` or the deployment name
   - Access Token: Azure OpenAI API key
5. Save. SkyCMS should infer the deployment from the endpoint.

Official references:

- Azure OpenAI REST reference: <https://learn.microsoft.com/en-us/azure/foundry/openai/reference>
- OpenAI vs Azure OpenAI endpoint differences: <https://learn.microsoft.com/en-us/azure/foundry-classic/openai/how-to/switching-endpoints>

Notes:

- Azure OpenAI uses the `api-key` header rather than a bearer token for API key auth.
- In Azure OpenAI, the effective model is often the **deployment name** embedded in the endpoint URL.

### Local OpenAI-compatible servers

Best when you want local or self-hosted inference and are willing to manage your own runtime.

Typical examples:

- Ollama
- other local gateways that expose an OpenAI-compatible `/v1/chat/completions` endpoint

Example Ollama setup:

1. Install Ollama.
2. Pull a model, for example `llama3.1`, `mistral`, or another compatible local model.
3. Configure SkyCMS with:
   - Endpoint: `http://localhost:11434/v1/chat/completions`
   - Model: your local model name
   - Access Token: any placeholder value if the local server requires a non-empty API key field but ignores it

Official reference:

- Ollama OpenAI compatibility: <https://ollama.com/blog/openai-compatibility>

Notes:

- Local providers usually do not support live model discovery in SkyCMS.
- They are often the best choice for zero-usage-cost experimentation on a developer workstation.

## Providers that need extra care

### Azure AI Foundry model inference endpoints

SkyCMS can classify Azure AI Foundry-style endpoints, but the current model discovery layer does not yet expose a full catalog workflow for them.

Document this internally as:

- potentially usable when the endpoint is OpenAI-compatible,
- not yet a first-class discovery experience in the current SkyCMS UI.

### Anthropic direct API

The direct Claude API is **not** an OpenAI-compatible chat completions API.

That means you should not treat Anthropic's native endpoint as a drop-in preset for the current SkyCMS AI proxy. If you want Claude-family models in SkyCMS today, use a provider or gateway that presents them through an OpenAI-compatible interface.

## Validation checklist

After saving your provider settings:

1. Reopen the code editor.
2. Confirm the AI indicator shows the provider as available.
3. Open AI chat in Monaco and in the page editor.
4. If supported, load or refresh models and verify the picker is populated.
5. Open **Editor -> AI Help Chat** and verify general help responds.

## Related guides

- [AI Provider Comparison](./provider-comparison.md)
- [Possible Free AI Services](./free-services.md)
- [AI Assistant for Editors](../../for-editors/ai-assistant.md)
- [AI Provider Setup](../../for-editors/ai-provider-setup.md)
- [AI Integration Architecture](../../for-developers/ai-integration.md)
