<!-- Audience: Administrators, Developers, and Evaluators -->
<!-- Type: Reference / Comparison -->
<!-- Status: Draft -->

# Possible Free AI Services for SkyCMS

## When to use this page

Use this page when you need to:

- try SkyCMS AI without committing to a paid provider first,
- evaluate low-cost or no-cost options,
- understand which free options are easiest to connect.

## Important note

Free AI offers change frequently.

Before you rely on any service for production, always verify:

- current pricing,
- rate limits,
- terms of service,
- supported regions,
- whether the endpoint is still OpenAI-compatible.

## Best free-first options for SkyCMS

### 1. GitHub Models

Why it is useful:

- GitHub documents free experimentation in the playground and API,
- the endpoint works well with current SkyCMS discovery and model selection,
- setup is simple if you already have a GitHub account.

What you need:

- GitHub account,
- personal access token with **Models: Read** permission.

Why it is the best first choice:

- hosted,
- no local model management,
- good quality models for evaluation,
- current SkyCMS support is strong.

Official references:

- <https://docs.github.com/en/github-models/use-github-models/prototyping-with-ai-models>
- <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>

### 2. Ollama

Why it is useful:

- runs locally,
- no vendor usage charges,
- exposes an OpenAI-compatible endpoint.

What you need:

- local machine or server,
- installed Ollama runtime,
- one or more pulled local models.

Tradeoff:

- you pay in local hardware requirements and operational effort instead of API usage.

Official reference:

- <https://ollama.com/blog/openai-compatibility>

### 3. Other local OpenAI-compatible runtimes

There are other local tools and gateways that expose an OpenAI-style endpoint for local experimentation.

Use these only if you confirm they support:

- `/v1/chat/completions`,
- the model names you plan to use,
- response shapes compatible with the current SkyCMS AI proxy.

## Options that may offer free trials or limited free tiers

These can be useful, but you should verify them before documenting a production setup for your team:

- OpenRouter free-model offerings,
- cloud vendor credits or trial subscriptions,
- hosted community gateways exposing compatible APIs.

Because these offers and limits change often, keep the recommendation general rather than promising a specific quota.

## Options that are usually not free

These are strong production choices, but they should not be treated as free defaults:

- OpenAI direct API,
- Azure OpenAI.

## Recommended free evaluation path

If you want the least friction:

1. start with GitHub Models,
2. validate the editor workflows and model pickers,
3. switch to OpenAI or Azure OpenAI only if you need a more formal production provider.

If you want the lowest ongoing spend for technical testing:

1. use Ollama locally,
2. test with a smaller local model first,
3. accept that quality and latency may differ from hosted frontier models.

## Related guides

- [AI Configuration Overview](./overview.md)
- [AI Provider Comparison](./provider-comparison.md)
