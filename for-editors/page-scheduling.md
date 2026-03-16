<!-- Audience: Content Editors -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Editors/PageScheduling.md -->

# Scheduling Pages

## When to use this page

Use this guide when you need to:

- publish pages on a planned schedule,
- verify scheduled job status,
- troubleshoot delayed or failed publish events.

## Scheduling model

SkyCMS supports scheduled publishing so content can go live at a specific future date/time.

How it works:

- Editors prepare and review content in draft.
- A publish time is set using **Publish Later**.
- The scheduler activates eligible content automatically.
- Prior live versions are replaced according to article versioning behavior.

## Create a scheduled publish

1. Open the page in editor.
2. Select **Review/Publish**.
3. Choose **Publish Later**.
4. Pick future date/time.
5. Confirm and save.

Best practices:

- Schedule important pages well ahead of launch.
- Double-check timezone assumptions.
- Re-preview right before the scheduled time if possible.

## Review schedule status

Administrators and Editors can review scheduler state in the page scheduler dashboard.

Use it to:

- verify upcoming jobs
- inspect recent execution history
- identify failed jobs needing retry

## Troubleshooting

Common issues and checks:

- Page did not publish: verify scheduled time is in the future and check scheduler dashboard for failures.
- No notification received: verify account email and mail delivery.
- Wrong scheduled time: update schedule and re-save the version.

## Related guides

- [Updating and Deleting Articles](./updating-and-deleting-articles.md)
- [Article Lifecycle Quick Reference](./article-lifecycle-reference.md)
