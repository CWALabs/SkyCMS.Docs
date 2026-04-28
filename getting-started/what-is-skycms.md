---
canonical_title: What Is SkyCMS?
description: Understand what SkyCMS is, who it is for, and why teams use it for multi-tenant content publishing.
doc_type: Explanation
product_area: getting-started
user_intent: understand-what-skycms-is-and-when-to-use-it
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

- editors get visual tools for creating and publishing content,
- developers get configurable architecture, provider choice, and deployment flexibility.

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

## Related links

- [Quick Start](./quick-start.md)
- [Key Concepts](./key-concepts.md)
- [Installation Overview](../installation/overview.md)
- [For Site Builders](../for-site-builders/index.md)
- [For Editors](../for-editors/index.md)
