---
canonical_title: FAQ
description: Quick answers to common SkyCMS questions about fit, deployment, publishing, operations, and adoption decisions.
doc_type: Reference
product_area: platform
user_intent: get-quick-answers-about-skycms
audience:
  - Developers
  - Administrators
  - Evaluators
  - Content Teams
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# FAQ

## Summary

This page answers high-frequency SkyCMS questions and links to deeper guides for implementation details.

## Outcome

After using this page, you should be able to answer common product, deployment, publishing, and onboarding questions quickly and move to the right deeper guide when you need implementation detail.

## Product fit

### What is SkyCMS?

SkyCMS is an edge-native CMS focused on fast publishing, strong editor usability, and multi-provider deployment flexibility.

### Who is SkyCMS best for?

SkyCMS is a strong fit when you need:

- non-technical editors to publish safely,
- rapid publish cycles,
- predictable performance from static-friendly delivery,
- low operational overhead for small and medium teams.

### When is SkyCMS not the best fit?

Consider alternatives if your primary requirement is:

- very large plugin ecosystems,
- deeply custom mobile-first multi-channel content delivery,
- highly specialized enterprise authoring workflows that require product-specific features outside current SkyCMS scope.

## Deployment and hosting

### Which providers are supported?

SkyCMS supports multiple storage and database providers, including Azure, AWS, Cloudflare, and local/containerized patterns.

Start with:

- [Installation Overview](../installation/overview.md)
- [Deployment Overview](../deployment/overview.md)
- [Configuration Overview](../configuration/overview.md)

### Can SkyCMS run on-premises?

Yes. SkyCMS can run in Docker-based environments on virtual machines, container platforms, or self-managed infrastructure.

### What is the fastest way to evaluate SkyCMS?

Use the demo deployment path:

- [Demo Deployment](../deployment/demo-deployment.md)

## Authoring and publishing

### Do editors need Git?

No. Core authoring workflows are available through the editor UI.

### How fast is publishing?

Publishing is designed for fast content promotion with minimal wait time in normal operation.

For operational model details:

- [Publishing Workflow](../deployment/publishing-workflow.md)
- [Publishing Modes](../for-editors/publishing-modes.md)

### Does SkyCMS support approval workflows?

Yes. Teams can use review and promotion workflows to control production publication.

## Architecture and operations

### Is SkyCMS multi-tenant?

Yes. Tenant-aware behavior is part of the core platform architecture.

See:

- [Architecture](../for-developers/architecture.md)
- [Core Platform Architecture](../for-developers/architecture-core-platform.md)

### Where should I start troubleshooting?

Use:

- [Troubleshooting](troubleshooting.md)

It is organized by diagnostic layer (database, storage, CDN, publishing, auth, runtime).

### Does SkyCMS support CI/CD workflows?

Yes. SkyCMS repositories include workflow patterns for build, test, packaging, and docs/deployment operations.

See:

- [CI/CD Pipelines](../deployment/cicd-pipelines.md)

## Adoption and onboarding

### Where should a new team start?

Use this path:

1. [Quick Start](../getting-started/quick-start.md)
2. [Installation Overview](../installation/overview.md)
3. [Minimum Required Settings](../installation/minimum-required-settings.md)
4. [For Site Builders Overview](../for-site-builders/overview.md)
5. [Visual Editor Quickstart](../for-editors/visual-editor-quickstart.md)

### How long does onboarding usually take?

Most teams can reach first successful setup quickly when required settings and provider credentials are prepared before setup.

## Community and contribution

### Is SkyCMS open source?

Yes. SkyCMS is open source and community contribution is supported.

### Where can I report issues or ask questions?

- [SkyCMS GitHub issues](https://github.com/CWALabs/SkyCMS/issues)
- [SkyCMS GitHub discussions](https://github.com/CWALabs/SkyCMS/discussions)

## Verification

This FAQ is doing its job when a reader can answer common evaluation or adoption questions quickly and identify the correct follow-up guide without searching the full documentation tree.

## Related links

- [What Is SkyCMS?](../getting-started/what-is-skycms.md)
- [Key Concepts](../getting-started/key-concepts.md)
- [For Developers](../for-developers/index.md)
- [For Editors](../for-editors/index.md)
- [For Site Builders](../for-site-builders/index.md)
