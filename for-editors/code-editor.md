<!-- Audience: Advanced Editors -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Editors/CodeEditor/ -->

# Code Editor Basics

## When to use this page

Use this guide when you need to:

- make precise HTML/CSS/JavaScript edits,
- apply a safe edit-validate-publish workflow,
- recover quickly from problematic source-level changes.

## When to use code editor

Use the code editor when visual editing is not enough and you need precise control of markup, styles, or scripts.

Best-fit use cases:

- Fine-grained HTML structure updates.
- CSS tweaks that are hard to express in visual tooling.
- Small JavaScript behavior updates in page or layout sections.
- Template and layout maintenance by technical editors.

The editor is Monaco-based (the same core editor used by VS Code), so you get syntax highlighting, code completion, and strong keyboard workflows.

## Safe editing workflow

1. Open the target content in draft mode when possible.
2. Edit one logical section at a time.
3. Save frequently (`Ctrl+S` / `Cmd+S`) even when auto-save is enabled.
4. Preview the page in context before publishing.
5. Publish only after verifying links, media, and responsive layout.

Tips:

- Use Emmet snippets for faster HTML/CSS authoring.
- Keep code blocks organized and readable.
- Prefer small, testable changes over large rewrites.

## Validation steps

Before publish, validate:

- HTML structure renders correctly in preview.
- CSS changes do not break mobile/tablet layouts.
- JavaScript changes run without console errors.
- Links and images resolve correctly.
- Accessibility basics: headings order and image alt text.

## Rollback strategy

If a change causes issues:

1. Stop publishing new edits.
2. Reopen the previous working version in editor history/version tools.
3. Restore or copy back the known-good section.
4. Re-test and publish the corrected version.

## Keyboard shortcuts

### File operations

| Shortcut | Action |
| --- | --- |
| Ctrl+S / Cmd+S | Save |
| Ctrl+F / Cmd+F | Find |
| Ctrl+H / Cmd+H | Find and replace |
| Ctrl+Z / Cmd+Z | Undo |
| Ctrl+Y / Cmd+Y | Redo |

### Editing

| Shortcut | Action |
| --- | --- |
| Ctrl+C / Cmd+C | Copy |
| Ctrl+X / Cmd+X | Cut |
| Ctrl+V / Cmd+V | Paste |
| Ctrl+A / Cmd+A | Select all |
| Ctrl+/ / Cmd+/ | Toggle comment |
| Shift+Alt+A | Block comment |
| Shift+Alt+F | Format document |
| Tab | Indent |
| Shift+Tab | Un-indent |

### Navigation

| Shortcut | Action |
| --- | --- |
| Ctrl+Home | Go to start of file |
| Ctrl+End | Go to end of file |
| Ctrl+G | Go to line number |

### Multi-cursor

| Shortcut | Action |
| --- | --- |
| Alt+Click | Add cursor at click position |
| Ctrl+D | Select next occurrence of word |
| Ctrl+Shift+L | Select all occurrences |
| Alt+Shift+Down | Add cursor below |
| Alt+Shift+Up | Add cursor above |

## AI assistance

The code editor supports both inline AI completions and a code-focused AI chat panel.

When AI is configured for the tenant:

- inline ghost-text suggestions can appear as you type,
- the editor chat can explain, refactor, or generate code for the active field,
- a model picker may be available if the configured provider supports user model selection,
- the **Detach** action can open the broader AI Help Chat in a separate window.

For full usage guidance, see [AI Assistant](./ai-assistant.md).

For provider setup, see [AI Provider Setup](./ai-provider-setup.md).

For diagnosing issues, see [AI Troubleshooting](./ai-troubleshooting.md).

## Related guides

- [File Manager](./file-manager.md)
- [File Manager Quick Start](./file-manager-quickstart.md)
- [Visual Editor](./visual-editor.md)
- [Image Editing](./image-editing.md)
- [AI Assistant](./ai-assistant.md)
- [AI Provider Setup](./ai-provider-setup.md)
- [AI Troubleshooting](./ai-troubleshooting.md)
