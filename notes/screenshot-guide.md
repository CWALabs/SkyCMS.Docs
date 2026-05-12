# Screenshot Guide for SkyCMS Docs

This guide covers how to capture, name, and embed screenshots in SkyCMS documentation pages.

---

## Where screenshots live

All screenshots for the `for-editors/` section go in:

```
d:\source\SkyCMS.Docs\for-editors\img\
```

Create the `img/` folder if it does not exist — MkDocs picks it up automatically.

For screenshots in other sections, create a parallel `img/` folder next to that section's `.md` files:

```
for-editors/img/
for-site-builders/img/
for-developers/img/
```

---

## Recommended dimensions

| Screenshot type | Width × Height | Notes |
|---|---|---|
| Full page / full editor view | **1600 × 900 px** | 16:9; captures toolbar + canvas + save button without cutting anything |
| Toolbar strip | **1600 × 280 px** | Tight horizontal crop; no wasted space above or below |
| Card grid / selection screen | **1200 × 600 px** | Fits 2-column layouts comfortably |
| Panel or dialog | **800 × 600 px** | Modals, sidebars, confirmation dialogs |

---

## DPI

Use **144 DPI** (2× / HiDPI).

At 144 DPI, a 1600 px wide image renders at a crisp 800 px on a retina display. If your tool does not let you set DPI, just capture at the pixel dimensions above — the browser handles scaling.

---

## Format

**PNG** for all UI screenshots. PNG is lossless, so text, icons, and button edges stay sharp. Avoid JPEG for UI captures.

---

## Before you take the screenshot

1. Set your browser zoom to **100%**. At 125% or 150%, rendered pixels are larger and the captured file will be smaller than intended.
2. On a high-DPI (HiDPI/Retina) monitor, Windows Snipping Tool captures at the monitor's native resolution. 800 px of screen content at 2× = 1600 px in the saved file — that is exactly what you want.
3. Close any personal information (email, username, profile photos) that should not appear in docs.
4. Use realistic but neutral content in editable fields — for example, "Sample page title" rather than a real client's page name.

---

## Naming convention

Use lowercase with hyphens. Match the filename in the `<!-- SCREENSHOT: ... -->` placeholder comment in the `.md` file.

Examples:
- `visual-editor-overview.png`
- `visual-editor-toolbar-annotated.png`
- `editor-selection-overview.png`
- `dashboard-overview-columns.png`

---

## Embedding in a doc

```markdown
![Alt text describing the image](img/filename.png)
```

Replace the `<!-- SCREENSHOT: ... -->` placeholder comment with the live image tag once the file is saved.

---

## Placeholder format (for new pages)

When writing a page before screenshots are ready, insert:

```markdown
<!-- SCREENSHOT: Description of what to capture. Suggested filename: img/name.png -->
```

This keeps the intent visible in the source without breaking the rendered page.
