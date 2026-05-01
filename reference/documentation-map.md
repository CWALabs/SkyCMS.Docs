---
canonical_title: Documentation Map
description: Visual map of how SkyCMS documentation is organized from homepage entry points to role, platform, and reference paths.
doc_type: Explanation
product_area: documentation
user_intent: understand-docs-organization-quickly
audience:
  - All
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-05-01
---

# Documentation Map

Use this page to understand how the documentation is organized and where to start based on your goal.

```mermaid
flowchart TB
    H[SkyCMS Docs Home]

    H --> S[Start Here]
    H --> R[Role Paths]
    H --> P[Platform Paths]
    H --> X[Reference]

    subgraph S1[Start Here]
      S --> W[What is SkyCMS]
      S --> Q[Quick Start]
      S --> K[Key Concepts]
    end

    subgraph R1[Role Paths]
      R --> E[Editors]
      R --> B[Site Builders]
      R --> D[Developers]

      E --> E1[Workflows and Tools]
      B --> B1[Layouts, Templates, Pages]
      D --> D1[Architecture, API, Extensibility]
    end

    subgraph P1[Platform Paths]
      P --> I[Installation]
      P --> C[Configuration]
      P --> G[Deployment]

      I --> I1[Wizard, Local, Docker, Cloud]
      C --> C1[Database, Storage, Email, CDN]
      G --> G1[Azure, Docker, Cloudflare, Demo]
    end

    subgraph X1[Reference]
      X --> F[Feature Catalog]
      X --> T[Troubleshooting]
      X --> L[Glossary and FAQ]
      X --> CH[Changelog]
    end

    classDef core fill:#2563eb,stroke:#1e3a8a,color:#fff;
    classDef group fill:#f8fafc,stroke:#94a3b8,color:#0f172a;
    class H core;
    class S,R,P,X,E,B,D,I,C,G,F,T,L,CH group;
```

## Start Points

- New to SkyCMS: start with [What is SkyCMS](../getting-started/what-is-skycms.md), then [Quick Start](../getting-started/quick-start.md).
- Working in a role: jump to [For Editors](../for-editors/index.md), [For Site Builders](../for-site-builders/index.md), or [For Developers](../for-developers/index.md).
- Looking up specifics: use [Feature Catalog](features/index.md), [FAQ](faq.md), and [Troubleshooting](troubleshooting.md).
