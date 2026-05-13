# Screenshot Standards for Documentation Work

Internal guide for doc writers. This file is for documentation process use and does not need to be published as end-user product docs.

---

## Goal

Use screenshots to increase trust and reduce confusion in task guides. Every screenshot should answer one question clearly: "What do I click or verify at this step?"

---

## Recommended dimensions

Use these defaults unless a page has a strong reason to differ.

| Screenshot type | Width x Height | Notes |
|---|---|---|
| Full app window | 1280 x 720 | Best default for context shots; stays readable in web docs |
| Alternate full view | 1024 x 768 | Good for denser UI or older layouts |
| Focused closeup | 800-1100 px wide | Crop to the exact control/panel being explained |
| Dialog/panel detail | 800 x 600 | Works well for modals and side panels |

Aspect ratio guidance:
- Prefer 16:9 or 4:3 for full-window captures.
- Keep closeups proportional to the UI region; avoid very tall, narrow crops.

---

## Full-screen vs closeup

Use a combination.

- Start a workflow with one full-window screenshot for context.
- Follow with focused closeups for exact actions (menus, buttons, command palette, indicators).
- Add annotation only when the target element is not obvious.

Practical mix for most guides:
- 1 context image for a new section.
- 2-4 focused images for the actual steps.

---

## What makes a screenshot "good"

### 1. Intentional framing

- Capture only what the reader needs for the step.
- Close unrelated tabs/panels.
- Keep the target UI near the visual center.

### 2. Readable text

- Capture at 100% app/browser zoom.
- Use a scale where labels and button text are legible without zooming the page.
- If text is hard to read at normal docs zoom, re-capture at a larger crop.

### 3. Consistency

- Use one theme (light or dark) per page.
- Keep similar zoom levels across a guide.
- Reuse naming and caption patterns.

### 4. Context plus explanation

Every image should include:
- Alt text
- A short caption
- Optional "What to notice" bullets for critical UI clues

---

## File format and size

- Use PNG for UI screenshots (text and icons stay crisp).
- Keep most files in the 150-300 KB range when possible.
- Try to keep any single screenshot under 500 KB.
- Compress oversized images without degrading text clarity.

---

## Capture preparation checklist

Before capture:

1. Set app/browser zoom to 100%.
2. Remove personal or sensitive information.
3. Use neutral sample content (for example, "Sample page title").
4. Close notifications and unrelated windows.
5. Ensure key controls are visible and not blocked by overlays.

---

## Naming convention

Use lowercase kebab-case and descriptive names.

Examples:
- `vscode-explorer-sidebar-overview.png`
- `vscode-explorer-command-palette-sync.png`
- `visual-editor-toolbar-save.png`
- `file-manager-upload-result.png`

---

## Placement and embedding

Store images in an `img/` folder next to the relevant markdown page section when possible.

Examples:
- `for-editors/img/`
- `for-site-builders/img/`
- `for-developers/img/`
- `getting-started/img/`

Markdown pattern:

```markdown
![Short alt text that states what is shown](img/file-name.png)

Caption: One sentence describing the user-visible state.
What to notice:
- Item 1
- Item 2
```

---

## Placeholder pattern while writing

If screenshots are pending, use:

```markdown
<!-- SCREENSHOT: What to capture and why. Suggested filename: img/file-name.png -->
```

This preserves intent in source until the final images are ready.

---

## Quick quality gate

Before merge, verify:

1. Each screenshot supports a specific step.
2. Text is legible at normal reading size.
3. Captions and alt text are present.
4. File names are descriptive and consistent.
5. Mobile rendering does not make images unusably small.
