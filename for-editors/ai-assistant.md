---
canonical_title: Using the SkyCMS AI Assistant
description: Use SkyCMS AI features in the Code Editor, Visual Editor, and AI Help Chat, including model selection and provider-aware behavior.
audience:
  - Content Editors
  - Advanced Editors
  - Administrators
doc_type: How-to
status: Draft
entities:
  - ai-assistant
  - code-editor
  - page-editor
  - ai-help-chat
keywords:
  - ai assistant
  - ai chat
  - model selection
  - editor ai
source: SkyCMS editor AI integration
---

# Using the SkyCMS AI Assistant

## When to use this page

Use this guide when you need to:

- work with AI inside SkyCMS editors,
- understand which AI tools are available in Monaco and CKEditor,
- select a model when the configured provider allows it,
- open the standalone AI Help Chat.

## What the AI assistant can do

SkyCMS currently exposes AI in three places:

- **Code Editor (Monaco)** for inline completions and code-focused chat,
- **Visual Editor (CKEditor)** for region-scoped writing help,
- **AI Help Chat** for broader product and site guidance.

All three experiences use the same tenant AI provider settings.

## Code Editor AI

The Monaco code editor includes two separate AI behaviors.

### Inline completions

As you type, SkyCMS can show ghost-text suggestions.

- Press **Tab** to accept the suggestion.
- Keep typing to dismiss it.
- Inline completions are best for short markup, CSS, or JavaScript continuations.

### AI chat panel

The code editor also includes an AI chat panel for longer requests such as:

- explain this block,
- fix syntax,
- improve structure,
- convert a selection,
- suggest head metadata or layout changes.

The AI prompt is enriched with the current editor context, including the active field, document kind, and section kind.

## Visual Editor AI

The CKEditor-based Visual Editor includes region-scoped writing assistance.

This is designed for editorial tasks such as:

- improving tone or clarity,
- rewriting a selected block,
- summarizing or shortening copy,
- generating polished HTML for the current editor region.

Important behavior:

- the assistant is scoped to the active rich-text region, not the whole page,
- applying a response may replace the current region or selection depending on the action you choose,
- if the region changed after the AI response was generated, SkyCMS may ask you to regenerate before applying non-replace actions.

## AI Help Chat

AI Help Chat is a broader assistant experience that is not tied to a single editor field.

You can open it from:

- **Editor -> AI Help Chat** in the main editor menu,
- the **Detach** link in AI chat panels when available.

Current help modes include:

- **SkyCMS help** for product guidance,
- **Website guidance** for practical content and website advice,
- **This site** for site-aware questions using the current page context when available.

### Detached window support

AI Help Chat can run in a detached window.

Use this when you want to:

- keep the help chat open while editing,
- compare answers across multiple content screens,
- work with a larger conversation surface.

## Model selection inside the editor

When the provider supports it, SkyCMS shows a **Model** picker inside the editor AI UI.

Current behavior:

- GitHub Models and OpenAI can expose a live model list,
- the selected model is saved for your account and editor context,
- leaving the selector on **Default** uses the tenant default behavior.

Examples:

- you may keep a fast model in Monaco for inline work,
- and use a stronger model in AI Help Chat for longer guidance.

If the provider does not support user model selection, the picker stays disabled and the tenant default is used.

## Refreshing available models

Use **Refresh** when:

- the administrator changed the provider configuration,
- the provider published additional models,
- the picker looks stale.

SkyCMS combines cached results with explicit refresh requests, so a refresh is the safest way to verify the latest provider catalog.

## Practical usage guidance

### Best uses for AI in Monaco

- small HTML scaffolds,
- CSS fixes,
- JavaScript cleanup,
- head/meta suggestions,
- explaining unfamiliar markup or scripts.

### Best uses for AI in CKEditor

- rewriting copy,
- improving readability,
- restructuring paragraphs,
- turning rough content into cleaner publish-ready copy.

### Best uses for AI Help Chat

- asking where content should live,
- understanding SkyCMS workflows,
- getting quick website guidance without editing a field directly.

## Limitations to keep in mind

- AI availability depends on the tenant provider configuration.
- Discovery and model selection vary by provider.
- Azure OpenAI usually uses an inferred deployment rather than a live model picker in the current SkyCMS implementation.
- Direct native Anthropic endpoints are not a standard SkyCMS preset because the current AI proxy expects OpenAI-compatible chat completions.

## Related guides

- [Code Editor](./code-editor.md)
- [Visual Editor](./page-editor.md)
- [AI Provider Setup](./ai-provider-setup.md)
- [AI Troubleshooting](./ai-troubleshooting.md)
- [AI Configuration Overview](../configuration/ai/overview.md)
