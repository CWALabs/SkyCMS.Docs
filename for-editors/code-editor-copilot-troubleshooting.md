<!-- Audience: Administrators -->
<!-- Type: Troubleshooting / Reference -->
<!-- Status: Draft -->

# Copilot Inline Assistance — Troubleshooting

## "Copilot inline unavailable" in the status bar

The code editor shows **Copilot inline unavailable** when any of the following is true:

| Condition | What to check |
| --- | --- |
| **Enabled is off** | Settings → Copilot Proxy Settings: toggle **Enabled** on and save. |
| **Endpoint is empty** | Settings → Copilot Proxy Settings: enter an endpoint URL. |
| **Access Token is empty** | Settings → Copilot Proxy Settings: enter a valid bearer token. |
| **Status endpoint returned an error** | See [Diagnosing status endpoint errors](#diagnosing-status-endpoint-errors). |
| **All retries failed** | The server was unreachable during page load; see [Retry behavior](#retry-behavior). |

---

## The status endpoint

The server exposes a lightweight status check at:

```
GET /api/copilot/status
```

Requires an authenticated session (same roles as the code editor: Reviewers, Administrators, Editors, Authors).

### Example response — fully configured

```json
{
  "enabled": true,
  "configured": true,
  "endpointConfigured": true,
  "model": "gpt-4o-mini"
}
```

- `enabled` — reflects the **Enabled** toggle in settings.
- `configured` — `true` when both endpoint and access token are non-empty.
- `endpointConfigured` — `true` when the endpoint field is non-empty.
- `model` — the **resolved** model name; `"auto"` is translated server-side to the default model.

### Example response — disabled

```json
{
  "enabled": false,
  "configured": false,
  "endpointConfigured": false,
  "model": "gpt-4o-mini"
}
```

You can call this endpoint manually from a browser DevTools console or cURL to verify the current server-side state:

```bash
curl -b "<session-cookie>" https://<your-domain>/api/copilot/status
```

---

## Retry behavior

When the code editor page loads, the client calls `/api/copilot/status` with automatic retry on failure:

| Parameter | Default |
| --- | --- |
| Attempts | 3 |
| Initial delay | 250 ms |
| Backoff multiplier | ×2 (250 → 500 → 1 000 ms) |
| Jitter | ±30% of each delay |

Jitter randomizes the exact timing of each retry across concurrent clients to avoid synchronized spikes during server cold-start. After three consecutive failures, the editor settles on **unavailable** and does not retry again until the page is reloaded.

If your server regularly takes more than a few seconds to warm up, increase the retry count or initial delay in the integration options.

---

## Diagnosing status endpoint errors

### 401 Unauthorized

The request session is not authenticated. Users must be signed in with an appropriate role (Reviewers, Administrators, Editors, or Authors).

### 401 with GitHub Models token errors

If you are using a fine-grained GitHub token and authentication fails, verify token permissions:

![GitHub fine-grained PAT permissions showing Account permission Models set to Read-only](../assets/images/copilot/PersonalAccessTokenPermissions.jpeg)

*Caption: For SkyCMS Copilot via GitHub Models, set only **Account → Models** to **Read-only**. Do not add Copilot Chat or other Copilot account permissions.*

### 429 Too Many Requests

The rate limiter (`copilot-inline` policy) is enforcing per-client limits. Default: 60 requests/minute in production. This is not expected during normal use (status is called once per page load). If you are seeing this during testing, reduce the frequency of manual status polls.

### 502 / 503 / 504 from the completion endpoint

These errors originate at the upstream provider (not SkyCMS). They appear in the browser console when a completion request is made, not during the status check.

| Code | Meaning |
| --- | --- |
| 502 Bad Gateway | SkyCMS received a malformed response from the upstream endpoint. |
| 503 Service Unavailable | The upstream endpoint is temporarily unavailable. |
| 504 Gateway Timeout | SkyCMS did not receive a response within `TimeoutMs`. |

For 504 errors, try increasing `TimeoutMs` in Copilot Proxy Settings. For persistent 502 / 503 errors, verify the endpoint URL and that your account has access to the requested model.

### "Model not found" errors

If the upstream provider returns a model-not-found error, check:

1. The **Model** field in settings matches a model your endpoint supports.
2. If you are using `auto`, the resolved default is `gpt-4o-mini` — confirm your provider supports this model.
3. For Azure OpenAI, the model name must match the **deployment name**, not the model family name.

---

## Completion quality issues

### Suggestions are off-topic or low quality

- Lower **Temperature** (towards `0.0` – `0.2`) for more focused code completions.
- Ensure the correct **language mode** is active in the editor (visible in the status bar). The editor passes the language identifier to the model as context.

### Suggestions are cut off

Increase **Max Tokens**. The default (160) is suitable for single-line and short multi-line completions. For larger snippet completions, try 256 – 512.

### Suggestions are slow to appear

- Check **Timeout (ms)**: if completions arrive just before the timeout, the upstream model may be under load. Increasing `TimeoutMs` allows the server to wait longer before giving up.
- Review network latency between your SkyCMS server and the upstream endpoint. Requests flow: Editor client → SkyCMS server → upstream provider.

---

## Related guides

- [Code Editor Basics](./code-editor.md)
- [Copilot Setup](./code-editor-copilot-setup.md)
