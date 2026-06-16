---
canonical_title: elFinder CQRS Rollout and Operations
description: Operational reference for elFinder command routing through CQRS, including overrides, fallback behavior, and rollback controls.
doc_type: Reference
product_area: file-management
user_intent: operate-elfinder-cqrs-routing-safely
audience:
  - Developers
  - Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-06-16
---

# elFinder CQRS Rollout and Operations

## Summary

SkyCMS routes elFinder connector commands through CQRS handlers in production.
A legacy path still exists as a safety fallback when mediator resolution is unavailable.

## Current state

- All 15 supported elFinder commands are on CQRS by default.
- Routing is controlled by configuration with optional per-command overrides.
- If MediatR cannot be resolved, requests fall back silently to the legacy implementation.

## Configuration

```json
"ElFinder": {
  "Cqrs": {
    "Enabled": true
  }
}
```

Per-command override:

```json
"ElFinder": {
  "Cqrs": {
    "Enabled": true,
    "Commands": {
      "rm": false
    }
  }
}
```

| Key | Type | Purpose |
| --- | --- | --- |
| `ElFinder:Cqrs:Enabled` | bool | Global CQRS switch for elFinder commands |
| `ElFinder:Cqrs:Commands:<cmd>` | bool | Per-command override (higher priority) |

## Evaluation order

1. Per-command key `ElFinder:Cqrs:Commands:<cmd>`
2. Global key `ElFinder:Cqrs:Enabled`
3. Query-string overrides (`__cqrs=1`, `__cqrs_<cmd>=1`) for ad-hoc testing
4. Legacy path default

## Ad-hoc testing flags

| Flag | Effect |
| --- | --- |
| `?__cqrs=1` | Force all commands to CQRS |
| `?__cqrs_<cmd>=1` | Force a specific command to CQRS |

Notes:

- `?__cqrs_<cmd>=0` is not supported.
- To disable a command, use `ElFinder:Cqrs:Commands:<cmd>=false`.

## Command handler inventory

| Command | Handler |
| --- | --- |
| `open` | `OpenCommandHandler` |
| `tree` | `TreeCommandHandler` |
| `ls` | `LsCommandHandler` |
| `mkdir` | `MkdirCommandHandler` |
| `mkfile` | `MkfileCommandHandler` |
| `rename` | `RenameCommandHandler` |
| `rm` | `RmCommandHandler` |
| `upload` | `UploadCommandHandler` |
| `get` | `GetCommandHandler` |
| `put` | `PutCommandHandler` |
| `paste` | `PasteCommandHandler` |
| `tmb` | `TmbCommandHandler` |
| `info` | `InfoCommandHandler` |
| `size` | `SizeCommandHandler` |
| `parents` | `ParentsCommandHandler` |

## Rollback options

Disable a single command:

```json
"ElFinder": {
  "Cqrs": {
    "Enabled": true,
    "Commands": {
      "rm": false
    }
  }
}
```

Disable all commands:

```json
"ElFinder": {
  "Cqrs": {
    "Enabled": false
  }
}
```

After config changes, restart the application so routing changes are applied consistently.

## Related guides

- [File & Media Management Features](../reference/features/05-file-and-media-management.md)
- [File Manager](../for-editors/file-manager.md)
- [SkyCMS VS Code Extension](./extending/vscode-extension.md)
- [Architecture Decision Records](./architecture-decision-records.md)
