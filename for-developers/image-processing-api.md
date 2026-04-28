---
canonical_title: Image Processing API
description: SkyCMS provides server-side image processing for generating thumbnails on demand. The File Manager uses this to display image previews, and the API is available to any authenticated user with file access.
doc_type: Reference
product_area: development
user_intent: understand-image-processing-api
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Image Processing API

## Summary

SkyCMS provides server-side image processing for generating thumbnails on demand. The File Manager uses this to display image previews, and the API is available to any authenticated user with file access.

## Thumbnail Endpoint

**`GET /FileManager/GetImageThumbnail`**

Generates a thumbnail for any image stored in blob storage.

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `target` | string | — | Path to the source image in blob storage |
| `width` | int | 120 | Desired width in pixels |
| `height` | int | 120 | Desired height in pixels |

### Response

- **Content-Type:** `image/webp`
- **Body:** WebP-encoded thumbnail image

### Supported Input Formats

| Extension | MIME Type |
|-----------|----------|
| `.png` | image/png |
| `.jpg` | image/jpeg |
| `.jpeg` | image/jpeg |
| `.gif` | image/gif |
| `.webp` | image/webp |

Unsupported formats return a `NotSupportedException`.

### Error Handling

- Invalid dimensions (zero or negative) → `400 Bad Request`
- Unsupported file extension → Exception
- File not found → Standard 404

### Authorization

Requires one of: Administrator, Editor, Author, or Team Member role.

---

## Processing Pipeline

The thumbnail generation follows this pipeline:

```
Request → Load from blob storage → Decode image → Resize (crop) → Encode as WebP → Response
```

1. **Storage read** — The image is loaded from blob storage via `IStorageContext.GetStreamAsync()`.
2. **Decode** — SixLabors.ImageSharp decodes the image from the stream.
3. **Resize** — The image is resized using crop mode, anchored at center, to the exact requested dimensions.
4. **Encode** — The result is encoded as WebP for optimal file size.

### Resize Modes

The thumbnail endpoint uses **crop mode** — the image is resized to fill the requested dimensions and excess is cropped from the edges (centered). This produces consistently-sized thumbnails regardless of the source aspect ratio.

---

## Image Processing Services

### ThumbnailCreator

The `ThumbnailCreator` service provides two methods for generating thumbnails:

| Method | Behavior |
|--------|----------|
| `Create(stream, size, contentType)` | Resize preserving aspect ratio (may not fill target dimensions) |
| `CreateFill(stream, size, contentType)` | Resize to fill target dimensions exactly (crops excess) |

Both methods use high-quality rendering settings:

- Compositing: SourceCopy
- Quality: HighQuality
- Smoothing: AntiAlias
- Interpolation: HighQualityBicubic

### ImageResizer

The `ImageResizer` service calculates new dimensions while preserving aspect ratio:

- Takes the original and target dimensions.
- Calculates the scaling factor to fit within the target.
- Enforces a minimum of 1 pixel per dimension.
- Default thumbnail size: 80×80 pixels.

---

## File Manager Integration

The File Manager UI uses the thumbnail endpoint to display image previews in the file browser. When a folder is opened:

1. The file list is loaded from blob storage.
2. For each image file, the browser requests a thumbnail via the API.
3. Thumbnails are displayed inline in the file list.

The File Manager supports:

- **Browsing** directories in blob storage.
- **Uploading** files with drag-and-drop.
- **Previewing** images with on-demand thumbnail generation.
- **Managing** files (rename, delete, move).

---

## Multi-Tenancy

- Blob storage access is scoped to the current tenant.
- Thumbnails are generated on-the-fly from tenant-specific storage.
- No cross-tenant file access is possible.

---

## See Also

- [Content Delivery Architecture](content-delivery-architecture.md) — How files are served to visitors
- [File Manager Documentation](../for-editors/file-manager.md) — Editor guide for the file manager
- [Site Settings](../for-editors/site-settings.md) — Blob storage URL configuration
