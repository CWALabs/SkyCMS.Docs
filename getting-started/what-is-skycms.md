---
canonical_title: What Is SkyCMS?
description: What SkyCMS is, who it is for, and why teams use it for multi-tenant content publishing.
doc_type: Explanation
product_area: getting-started
user_intent: evaluate-skycms-fit-for-your-team
audience:
	- All
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# What Is SkyCMS?

## Summary

SkyCMS is a multi-tenant content management system built on ASP.NET Core for teams that need flexible editing, publishing, and deployment options.

If you are new to SkyCMS, this page explains what the platform does before you install it or start building with it.

## Context

Most CMS platforms force teams to choose between editor-friendly tooling and developer-friendly architecture.

SkyCMS is designed to support both:

- editors get visual tools to create and publish content,
- developers get configurable architecture, provider choice, and deployment flexibility.

## Two ways to work, one shared platform

SkyCMS is built for teams that need both of these realities to be true:

- non-technical content creators can keep publishing work moving without depending on developers for routine content updates,
- developers can still work in code-first workflows and avoid restrictive CMS guardrails.

In practice, this means the same website can be maintained through a visual authoring path and a code-oriented path, depending on who is doing the work.

## For content creators: familiar writing experience

SkyCMS includes CKEditor as a first-class editing experience. For most page and blog maintenance work, content creators can use a familiar writing interface similar to a word processor.

Teams often use this model to reduce training overhead:

- developers and site builders set the structure,
- content creators update the text and media,
- everyone shares the same publishing workflow.

## For developers: CMS website as code

With the SkyCMS VS Code Explorer extension, developers can view and work with SkyCMS website assets and content fields from inside Visual Studio Code.

This supports a modern workflow where developers can:

- inspect and edit CMS-managed resources with IDE tooling,
- use familiar source-control and review practices,
- stay in a code-centric environment while still working with CMS content.

See [SkyCMS VS Code Extension](../for-developers/extending/vscode-extension.md).

## SkyCMS philosophy: remove barriers, not flexibility

SkyCMS is designed to remove barriers for both groups:

- content creators should not need deep technical training to keep content current,
- developers should not be forced into rigid abstractions that block creative implementation choices.

This is a core product stance, not a single feature. It shapes how editing modes, templates, code workflows, and handoff patterns are designed across the platform.

## Who SkyCMS is for

SkyCMS is primarily used by:

- content teams that need structured publishing workflows,
- site builders who design layouts and templates,
- developers and platform engineers who need extensibility and control,
- organizations running multiple websites or domains from one platform.

## Problems SkyCMS solves

SkyCMS addresses common web platform pain points:

- fragmented content workflows across teams,
- inconsistent publishing processes,
- limited deployment flexibility,
- high operational overhead for multi-site management.

## How SkyCMS works at a high level

At a high level, teams create content in the editor and publish it through the platform's publishing pipeline to public output.

```mermaid
flowchart LR
  Author[Author in Editor] --> Structure[Apply Layout and Template]
  Structure --> Publish[Publish Content]
  Publish --> Output[Public Website Output]
  Output --> Operate[Monitor and Operate]
```

## Core capabilities

SkyCMS includes:

- multiple editing experiences, including visual and code-oriented options,
- Visual Studio Code integration for code-first CMS workflows,
- structured content lifecycle and publishing states,
- layout and template composition for reusable site design,
- multi-tenant architecture support,
- flexible deployment options for local, containerized, and cloud-hosted environments.

## When to choose SkyCMS

SkyCMS is a strong fit when you need:

- one platform for both content operations and technical control,
- predictable publishing workflow for multiple teams,
- deployment flexibility across environments,
- room to scale from one site to many domains.

## For AI consumers

For AI assistants, search pipelines, and prompt-grounding workflows, use:

- [Key Concepts](key-concepts.md) as the canonical vocabulary source,
- [AI Context Pack](../reference/ai-context-pack.md) for compact authoritative retrieval paths.

## Related guides

- [Why SkyCMS Is Different](./why-skycms-is-different.md)
- [VS Code Explorer Quick Tour](./vscode-explorer-quick-tour.md)
- [Quick Start](./quick-start.md)
- [Key Concepts](./key-concepts.md)
- [Installation Overview](../installation/overview.md)
- [For Site Builders](../for-site-builders/index.md)
- [For Editors](../for-editors/index.md)
