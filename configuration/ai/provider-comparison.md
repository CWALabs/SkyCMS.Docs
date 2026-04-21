<!-- Audience: Administrators, Developers, and Evaluators -->
<!-- Type: Comparison -->
<!-- Status: Draft -->

# AI Provider Comparison for SkyCMS

## When to use this page

Use this page when you need to:

- choose the best AI provider for SkyCMS,
- understand setup tradeoffs before enabling AI for a tenant,
- compare hosted, Azure-based, and local options.

## Comparison summary

SkyCMS currently works best with providers that expose an **OpenAI-compatible chat completions endpoint**.

The most practical choices today are:

- GitHub Models,
- OpenAI,
- Azure OpenAI,
- local OpenAI-compatible servers such as Ollama.

## Quick comparison table

| Provider | Best for | Cost profile | SkyCMS model discovery | Per-user model picker | Notes |
| --- | --- | --- | --- | --- | --- |
| GitHub Models | Fastest getting started path | Free experimentation with rate limits; paid options available later | Yes | Yes | Excellent trial/default option for many teams |
| OpenAI | Simple commercial hosted API | Paid usage | Yes | Yes | Straightforward setup and broad model ecosystem |
| Azure OpenAI | Azure-first production deployments | Paid Azure consumption | Inferred deployment, not full live catalog in current SkyCMS | No current editor picker for deployments | Strong governance and Azure billing alignment |
| Local OpenAI-compatible server | Local experimentation or privacy-sensitive testing | Usually hardware cost only | Usually no | Usually no | Best for technical teams comfortable managing local inference |

## GitHub Models

### Why choose GitHub Models

GitHub Models is the easiest hosted option for many SkyCMS teams because:

- the endpoint is OpenAI-compatible for SkyCMS integration,
- GitHub documents a free experimentation path,
- SkyCMS can load the live model catalog,
- editors can choose their preferred model in supported contexts.

### GitHub Models strengths

- easiest first-time setup,
- strong evaluation workflow in the GitHub playground,
- no separate Azure resource creation required for basic experimentation,
- good fit for developer-heavy teams already using GitHub.

### GitHub Models weaknesses

- preview and rate-limit rules can change,
- not the best choice when a team needs strict enterprise Azure governance or private-network alignment.

### Recommended GitHub Models use in SkyCMS

Use GitHub Models when you want to turn on AI quickly and start validating how editors use the features before committing to a production provider strategy.

## OpenAI

### Why choose OpenAI

OpenAI is the cleanest direct commercial API option for teams that want a hosted provider without Azure deployment complexity.

### OpenAI strengths

- simple API key workflow,
- live model discovery in current SkyCMS,
- per-user model selection in supported editor contexts,
- widely documented ecosystem.

### OpenAI weaknesses

- direct vendor billing,
- less alignment for teams standardizing on Azure-native governance patterns.

### Recommended OpenAI use in SkyCMS

Use OpenAI when you want predictable hosted AI behavior, easy setup, and current SkyCMS support for live model catalogs and editor model pickers.

## Azure OpenAI

### Why choose Azure OpenAI

Azure OpenAI is the strongest fit when SkyCMS is already deployed in Azure and the organization wants:

- Azure subscription billing,
- Azure resource governance,
- deployment-based model lifecycle control,
- enterprise networking and compliance patterns.

### Azure OpenAI strengths

- Azure-native operational model,
- deployment-scoped endpoints,
- strong fit for enterprise approval workflows,
- can align with Azure identity and secret-management practices.

### Azure OpenAI weaknesses

- slightly more setup overhead,
- model names are deployment names in practice,
- SkyCMS currently infers the deployment from the endpoint instead of loading a full live deployment catalog.

### Recommended Azure OpenAI use in SkyCMS

Use Azure OpenAI when production governance matters more than quick experimentation.

## Local OpenAI-compatible servers

### Why choose local OpenAI-compatible servers

Local providers are useful for:

- no-usage-fee experimentation,
- disconnected or local-only development workflows,
- teams that want to test the SkyCMS AI UX before buying a hosted service.

### Local provider strengths

- local control,
- no per-token vendor bill,
- useful for demos and development labs.

### Local provider weaknesses

- quality depends on local model choice and hardware,
- discovery and model catalog support are usually limited,
- not a plug-and-play production answer for most non-technical teams.

### Recommended local provider use in SkyCMS

Use local providers mainly for technical evaluation, demos, or controlled self-hosted deployments.

## Azure AI Foundry endpoints

SkyCMS can identify Azure AI Foundry-style endpoints, but the current product behavior is more limited than GitHub Models or OpenAI.

Treat this as:

- a possible advanced integration path,
- not yet the easiest documented choice for first-time AI enablement in SkyCMS.

## Native Claude / Anthropic API

The native Claude API is not OpenAI-compatible. That matters because SkyCMS currently expects OpenAI-compatible chat completions behavior.

Recommendation:

- do not document Anthropic's native endpoint as a standard SkyCMS preset,
- only use Claude-family models through a compatible hosting or gateway path that matches the SkyCMS proxy contract.

## Recommendation by scenario

| Scenario | Recommended starting point |
| --- | --- |
| I want the fastest successful first setup | GitHub Models |
| I want a direct hosted commercial API | OpenAI |
| I want Azure billing and Azure governance | Azure OpenAI |
| I want to experiment locally for the lowest cost | Ollama or another local OpenAI-compatible server |

## Suggested rollout path

For many teams, the pragmatic rollout is:

1. start with GitHub Models or a local server,
2. validate real editor workflows in Monaco, CKEditor, and AI Help Chat,
3. move to OpenAI or Azure OpenAI when you want a stable production provider strategy.

## Related guides

- [AI Configuration Overview](./overview.md)
- [Possible Free AI Services](./free-services.md)
- [AI Assistant for Editors](../../for-editors/ai-assistant.md)
