---
canonical_title: Feature Catalog: File & Media Management
description: Feature inventory for SkyCMS file management — browser-based file manager, multi-cloud blob storage, image processing, and content delivery.
doc_type: Reference
product_area: file-management
user_intent: reference-file-and-media-management-features
audience:
  - Editors
  - Administrators
  - Developers
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-30
---

# File & Media Management

SkyCMS provides a browser-based file manager built on **elFinder 2.1** (via the `SkyCMS.Drivers.ElFinder` CQRS driver) for uploading, organizing, editing, and serving media assets and code files. Files are stored in cloud blob storage with a unified abstraction layer that supports multiple cloud providers.

**Audiences:** Editors, Authors, Administrators, Developers

**Jump to:**

- [File Manager](#1-file-manager)
- [Multi-Cloud Storage Abstraction](#2-multi-cloud-storage-abstraction)
- [Image Processing](#3-image-processing)
- [Content Delivery](#4-content-delivery)

---

## 1. File Manager

> **Documentation:** [File Manager](../../for-editors/file-manager.md) · [File Manager Quickstart](../../for-editors/file-manager-quickstart.md) · [File Manager Toolbar Reference](../../for-editors/file-manager-toolbar-reference.md)

A full-featured browser-based file management interface for all site assets.

### Browsing & Navigation

- elFinder 2.1 file browser with dual-pane layout (folder tree + file area)
- Back / Forward / Home / Up navigation via toolbar
- Breadcrumb trail for direct navigation to any ancestor folder
- Grid (thumbnail) and list view toggle via toolbar
- Thumbnail gallery with auto-generated 120 × 120 px thumbnails
- Sort by name, type, modified date, or file size via toolbar
- Search by filename within the current folder
- Filter by directories only or images only (in image picker and folder picker modes)
- Copy file URL via right-click → **Get URL** or the Info properties panel

### File Operations

| Operation | Description |
|-----------|-------------|
| **Upload** | Drag-and-drop or file picker upload |
| **Create File** | Create new text-based files from the browser |
| **Create Folder** | Create new folders for organization |
| **Rename** | Rename files and folders |
| **Copy** | Copy files or folders to a new location |
| **Move** | Move files or folders |
| **Delete** | Remove files and folders |
| **Download** | Download files to local machine |

### Upload Capabilities

- **FilePond** upload widget: drop files anywhere on the page or click **Upload Files**
- Chunked upload (5 MB chunks) for reliable large-file transfers
- Simultaneous multi-file upload with per-file progress
- Uploads always target the folder currently open in the elFinder browser
- Automatic folder refresh after all uploads complete
- Simple upload mode for quick image insertion from editors

### Integrated Editors

Files can be edited directly in the browser depending on type:

- **Code files** → Monaco Code Editor (opened via elFinder toolbar or right-click → **Open**)
  - Supported: `.html`, `.htm`, `.css`, `.js`, `.json`, `.xml`, `.txt`
- **Image files** → Filerobot Image Editor (opened via elFinder toolbar or right-click → **Open**)
  - Editable: `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`
  - Preview-only: `.apng`, `.avif`, `.svg`

### Image Assets API

- `GetImageAssets(path, exclude)` — JSON endpoint returning image file list with metadata
- `GetImageThumbnail(target, width, height)` — On-demand thumbnail generation at specified dimensions

### Role-Based Access

| Role | Access Level |
|------|-------------|
| Administrator | Full access (all operations) |
| Editor | Full access (all operations) |
| Author | Full access (all operations) |
| Team Member | Full access (all operations) |
| Reviewer | Read-only (browse and view only) |

---

## 2. Multi-Cloud Storage Abstraction

> **Documentation:** [Storage Overview](../../configuration/storage/overview.md) · [Azure Blob Storage](../../configuration/storage/azure-blob.md) · [Amazon S3](../../configuration/storage/s3.md) · [Cloudflare R2](../../configuration/storage/cloudflare-r2.md) · [Google Cloud Storage](../../configuration/storage/google-cloud.md) · [Storage Configuration Reference](../../configuration/storage/configuration-reference.md) · [Storage Provider Auto-Detection](../../for-developers/storage-provider-auto-detection.md)

SkyCMS abstracts file storage through a unified `StorageContext` layer, allowing the same file management interface to work across multiple cloud providers.

### Supported Storage Providers

| Provider | Connection Type | Use Cases |
|----------|----------------|-----------|
| **Azure Blob Storage** | Azure connection string | Primary cloud storage for Azure deployments |
| **Amazon S3** | AWS credentials | AWS deployments, S3-compatible services |
| **Cloudflare R2** | S3-compatible API | Edge-optimized storage, Cloudflare deployments |
| **Azure Files** | Azure file share connection | SMB-compatible file share scenarios |

### Runtime Provider Selection

- Provider is auto-detected from the connection string at runtime
- Detection is implemented in the `Cosmos.BlobService` storage runtime
- No code changes needed to switch providers
- Multi-tenant deployments can use different providers per tenant

### Storage Operations

- Upload / download / delete files
- Copy and move operations
- Stream-based operations for large files
- Chunked uploads with progress tracking (AWS multi-part, Azure append blobs)
- Directory operations (create, list, delete)
- Custom metadata per file
- Image dimension extraction
- Static website hosting management (Azure)

### Caching

- In-memory caching for frequently accessed file metadata
- Configurable cache lifetimes

---

## 3. Image Processing

> **Documentation:** [Image Processing API](../../for-developers/image-processing-api.md) · [Image Editing](../../for-editors/image-editing.md)

### Thumbnail Generation

- On-demand thumbnail generation via `ThumbnailCreator`
- Custom width/height dimensions
- Served via File Manager API endpoint

### Image Resizing

- Server-side image resizing via `ImageResizer`
- Used for optimizing images during upload or on request

### In-Browser Image Editing

Full Filerobot Image Editor integration (see [Content Editing & Authoring](01-content-editing-and-authoring.md#5-image-editor) for complete details):

- Crop, rotate, flip, resize
- Brightness, contrast, saturation adjustments
- Filters and fine-tuning
- Annotation (text, shapes, arrows, freehand)
- Watermarking
- Save back to cloud storage

---

## 4. Content Delivery

> **Documentation:** [Content Delivery Architecture](../../for-developers/content-delivery-architecture.md) · [CDN Overview](../../configuration/cdn/overview.md) · [CDN Configuration Reference](../../configuration/cdn/configuration-reference.md)

### Secure File Access

- `PubController` provides authenticated file proxy endpoints
- Role-based file access enforcement
- Files served through the application with proper MIME types

### CDN Integration

- Files can be served through CDN for public sites
- CDN cache purge on publish
- Supports Azure CDN, Cloudflare, AWS CloudFront, Sucuri
- CDN configuration managed per tenant

### Static Asset Serving

- Static file middleware for public assets
- SPA fallback routing for single-page applications
- Efficient file streaming for large assets
