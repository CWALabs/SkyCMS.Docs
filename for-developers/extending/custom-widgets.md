---
canonical_title: Extending SkyCMS with Custom Widgets
description: Build, integrate, and validate custom widget behavior for SkyCMS editing experiences.
doc_type: How-to
product_area: extensibility
user_intent: create-and-integrate-custom-widgets
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Extending SkyCMS with Custom Widgets

## Summary

Build, integrate, and validate custom widget behavior for SkyCMS editing experiences.

## Outcome

After completing this guide, you can add a widget-enabled editable region, wire initialization logic, and verify save/publish behavior.

## Extension model

SkyCMS editor extensibility is region-driven:

- template markup defines editable regions,
- region configuration controls editor or widget behavior,
- runtime scripts initialize widget logic in the editor context.

Common region attributes:

- data-ccms-ceid for stable editable-region identity,
- data-ccms-new=true for auto-generated region IDs,
- data-editor-config to select an editor or widget profile.

## Build a widget-ready region

Example markup:

```html
<div data-editor-config="image-widget" data-ccms-new="true" class="ck-content"></div>
```

Guidelines:

1. avoid nested editable regions,
2. keep region IDs stable across template revisions,
3. use semantic container structure around widget regions.

## Integration workflow

1. Define region markup in your template/layout.
2. Add widget initialization script in editor asset pipeline.
3. Validate widget load in editor iframe context.
4. Verify edited data persists and publishes correctly.
5. Verify clone/delete behavior if region is in repeatable blocks.

## Validation checklist

- widget initializes on first render,
- content changes persist after save and reload,
- publish output reflects widget state,
- no console errors during init/change/delete,
- duplicated regions get unique editable identifiers.

## Troubleshooting

If widget does not initialize:

- verify data-editor-config value,
- verify required JS/CSS assets are loaded,
- verify region is not nested inside another editable region.

If content is lost after template changes:

- confirm region identifiers remained stable,
- confirm migration mapping for changed region structure.

If publish output is stale:

- verify publish completed successfully,
- verify cache/CDN invalidation behavior,
- verify generated output path is correct.

## Related guides

- [Creating Editable Areas](../website-launch/CreatingEditableAreas.md)
- [Templates](../templates.md)
- [Layouts](../layouts.md)
- [Visual Editor](../../for-editors/visual-editor.md)
- [Troubleshooting](../../reference/troubleshooting.md)
