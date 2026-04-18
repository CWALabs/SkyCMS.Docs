# File & Media Management

SkyCMS provides a browser-based file manager for uploading, organizing, editing, and serving media assets and code files. Files are stored in cloud blob storage with a unified abstraction layer that supports multiple cloud providers.

**Audiences:** Editors, Authors, Administrators, Developers

**Jump to:**

- [File Manager](#1-file-manager)
- [Multi-Cloud Storage Abstraction](#2-multi-cloud-storage-abstraction)
- [Image Processing](#3-image-processing)
- [Content Delivery](#4-content-delivery)

---

## 1. File Manager

> **Documentation:** [File Manager](../../for-editors/file-manager.md) · [File Manager Quickstart](../../for-editors/file-manager-quickstart.md)

A full-featured browser-based file management interface for all site assets.

### Browsing & Navigation

- Hierarchical folder structure with breadcrumb navigation
- Thumbnail gallery view (120×120 px auto-generated thumbnails)
- Sortable columns: name, type, modified date, file size
- Pagination controls: 10, 20, 50, or 100 items per page
- Filter by directories only or images only
- Copy file URL to clipboard with one click

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

- Drag-and-drop uploads
- Chunked upload support for large files (25 MB chunks)
- Checksum-based resumable uploads for interrupted transfers
- Simple upload mode for quick image insertion from editors
- Image upload with automatic metadata extraction (dimensions)

### Integrated Editors

Files can be edited directly in the browser depending on type:

- **Code files** → Monaco Code Editor (syntax highlighting, IntelliSense)
  - Supported: `.html`, `.htm`, `.css`, `.js`, `.json`, `.xml`, `.txt`
- **Image files** → Filerobot Image Editor (crop, resize, annotate, filter)
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
