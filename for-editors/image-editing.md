---
canonical_title: Image Editing
description: Edit SkyCMS media assets in the browser, prepare them for publication, and verify accessibility and performance basics.
doc_type: How-to
product_area: editing
user_intent: edit-images-inside-skycms-before-publishing
audience:
	- Content Editors
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Image Editing

## Summary

Use this guide when you need to:

- prepare images for page publication,
- apply edits without external image software,
- verify accessibility and performance for media assets.

## Outcome

After completing this guide, you should be able to open the in-browser editor, make common adjustments, and save images that are ready for content use.

## Open an image for editing

1. Open File Manager.
2. Select an image (`.png`, `.jpg`, `.jpeg`, `.gif`, or `.webp`).
3. Choose **Edit Image** to open the in-browser editor.

Recommended starting point:

- Work from a high-quality original.
- Keep a backup copy when the original must be preserved.

## Crop and adjust assets

Use built-in tools to prepare images for page use:

- Crop and rotate for framing.
- Resize for web performance.
- Fine-tune brightness, contrast, saturation, and warmth.
- Add annotations (text, arrows, shapes) when needed.
- Apply watermarking for branding or attribution.

General guidance:

- Resize down for best quality retention.
- Avoid repeated lossy saves on the same JPEG.
- Keep output dimensions matched to display size.

## Accessibility metadata

When adding edited images to pages:

- Provide meaningful alt text.
- Ensure annotation colors have enough contrast.
- Avoid overlays that obscure key content.

## Performance tips

- Optimize dimensions before publish.
- Use modern formats where practical (`.webp` is often efficient).
- Keep large media to dedicated assets, not inline-heavy content regions.
- Preview on desktop and mobile before publishing.

Troubleshooting quick checks:

- If save fails, verify folder write permissions.
- If the image does not load, verify format and size.
- If the editor is slow, reduce image dimensions and close extra browser tabs.

## Verification

Image editing is working when you can open a supported image, save the revised version successfully, and confirm the updated asset renders correctly in the file list or target page.

## Available editing tools

The Filerobot editor provides the following tool tabs:

| Tab | What it does |
| --- | --- |
| Adjust | Brightness, contrast, exposure, saturation, hue, shadows, highlights, warmth |
| Annotate | Text overlays, shapes (rectangle, circle, triangle, polygon), arrows, lines, free draw |
| Filters | Vintage, sepia, grayscale, blur, sharpen, and custom adjustments |
| Fine-Tune | Individual RGB channel adjustments, gamma, and color curves |
| Resize | Custom dimensions, social media presets, aspect ratio lock |
| Crop | Freeform crop, aspect ratio presets (1:1, 4:3, 21:9), social media format presets |
| Watermark | Text and image watermarks with positioning and opacity control |

## Keyboard shortcuts

| Shortcut | Action |
| --- | --- |
| Ctrl+Z / Cmd+Z | Undo |
| Ctrl+Y / Cmd+Y | Redo |
| Ctrl+S / Cmd+S | Save |
| Delete | Remove selected annotation |
| Escape | Cancel current tool |

## Related guides

- [File Manager](./file-manager.md)
- [File Manager Quick Start](./file-manager-quickstart.md)
- [Visual Editor](./visual-editor.md)
- [Code Editor](./code-editor.md)
