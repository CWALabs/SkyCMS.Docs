<!-- Audience: Administrators -->
<!-- Type: How-to / Reference -->
<!-- Status: Draft -->

# Copilot Inline Assistance — Setup

## Overview

The code editor supports AI-powered inline completions backed by a server-side proxy. When enabled, the editor displays ghost-text suggestions as you type; pressing **Tab** accepts the current suggestion.

The feature is off by default and requires an administrator to configure the proxy settings before it is available to editors.

## Where to configure

Open **Settings → Copilot Proxy Settings** in the SkyCMS administration panel.

Settings are stored in the SkyCMS `Settings` table (ApplicationDbContext) and apply to all editors on the tenant. There is no per-user override.

## Fields

### Enabled

Toggles the feature on or off globally. When disabled, the status endpoint reports the feature as unavailable and the code editor does not load the inline completion provider, regardless of whether a valid token is present.

### Endpoint

The full URL of an OpenAI-compatible **chat completions** API endpoint.

Examples:

| Provider | Endpoint |
| --- | --- |
| GitHub Models (preview) | `https://models.inference.ai.azure.com` |
| Azure OpenAI | `https://<resource>.openai.azure.com/openai/deployments/<deployment>/chat/completions?api-version=2024-02-01` |
| OpenAI | `https://api.openai.com/v1/chat/completions` |
| Local (Ollama) | `http://localhost:11434/v1/chat/completions` |

The server appends `/chat/completions` when the endpoint does not already include it, so for GitHub Models you can supply the base URL.

### Model

The model name passed to the upstream provider.

Use `auto` (the default) to let SkyCMS select an appropriate default (`gpt-4o-mini`). You can override this with any model supported by your endpoint, for example:

- `gpt-4o`
- `gpt-4o-mini`
- `codestral-latest`

The resolved model name is visible in the status endpoint response (`/api/copilot/status`).

### Access Token

A bearer token sent to the upstream endpoint. The value is masked in the UI after saving and is never returned to the browser.

See [Getting a GitHub Personal Access Token](#getting-a-github-personal-access-token) below for the most common provider.

### Timeout (ms)

How long the server waits for the upstream provider before returning a timeout error to the editor. Default: `8000` (8 seconds). Acceptable range: 1 000 – 60 000 ms.

Increase this value if you are using a model with high cold-start latency (for example, a local inference server).

### Temperature

Controls response randomness. Default: `0.2`. Range: 0 – 2.

Lower values (`0.0` – `0.3`) produce more focused, deterministic completions and are the best choice for code. Higher values introduce more creative variation.

### Max Tokens

Maximum number of tokens the model returns per completion. Default: `160`. Range: 16 – 1 024.

Code completions rarely benefit from large values. Keeping this low reduces latency and cost.

---

## Getting a GitHub Personal Access Token

GitHub Models is the simplest option because it is free (under usage limits), does not require credit card information, and uses your existing GitHub account.

1. Sign in at [github.com](https://github.com).
2. Navigate to **Settings → Developer settings → Personal access tokens → Fine-grained tokens** (or classic tokens).
3. Click **Generate new token**.
4. Set an expiration (90 days is a sensible default; you will need to rotate it before it expires).
5. Under **Permissions**, grant GitHub Models access:
	- **Fine-grained PAT**: add **Account permission → Models: Read** (`user_models=read`).
	- **Classic PAT**: include the **`models:read`** scope.
	- Do **not** select **Copilot Chat**, **Copilot Editor Context**, or **Copilot Requests** for this SkyCMS integration. Those permissions are for Copilot-specific APIs, not the GitHub Models inference endpoint used here.

![GitHub fine-grained PAT permissions showing Account permission Models set to Read-only](../assets/images/copilot/PersonalAccessTokenPermissions.jpeg)

*Caption: Fine-grained PAT configuration for SkyCMS Copilot integration. Set only **Account → Models** to **Read-only**.*

6. Copy the generated token immediately; it will not be shown again.
7. Paste the token into the **Access Token** field in SkyCMS Copilot Proxy Settings.

> **Security note**: Treat this token like a password. Do not commit it to source control. SkyCMS stores it encrypted in the Settings table and never exposes it in API responses or browser network traffic.



### Token rotation

Rotate your token before it expires:

1. Generate a new token in GitHub settings.
2. Paste the new value into SkyCMS Copilot Proxy Settings and save.
3. Revoke the old token in GitHub settings.

---

## Expected editor behavior after setup

Once settings are saved with **Enabled** on and a valid endpoint/token:

1. The next page load that includes the code editor will call the status endpoint (`GET /api/copilot/status`).
2. If the server reports `enabled: true` and `configured: true`, the inline completion provider activates automatically.
3. The status bar at the bottom of the editor shows **Copilot inline ready**.
4. As you type, the editor displays ghost-text suggestions in the current language context.
5. Press **Tab** to accept the current suggestion, or continue typing to dismiss it.

If the server is temporarily unavailable at page load, the client retries automatically (up to three attempts with backoff) before settling on an unavailable state. Editors can continue editing without completions; the provider does not block or degrade other editor functionality.

---

## Related guides

- [Code Editor Basics](./code-editor.md)
- [Copilot Troubleshooting](./code-editor-copilot-troubleshooting.md)
