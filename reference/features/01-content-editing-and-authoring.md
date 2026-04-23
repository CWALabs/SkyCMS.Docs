# Content Editing & Authoring

SkyCMS provides four distinct editing experiences, allowing content creators to choose the tool that matches their skill level and task. All editors share a common save/publish pipeline, version history, and real-time collaboration layer.

**Audiences:** Editors, Authors, Reviewers, Administrators

**Jump to:**

- [Visual Editor (WYSIWYG)](#1-visual-editor-wysiwyg)
- [Page Builder (Visual Drag-and-Drop)](#2-page-builder-visual-drag-and-drop)
- [Code Editor](#3-code-editor)
- [AI Assistant Integration](#4-ai-assistant-integration)
- [Image Editor](#5-image-editor)
- [Real-Time Collaborative Editing](#6-real-time-collaborative-editing)

---

## 1. Visual Editor (WYSIWYG)

A rich-text inline editing experience built on **CKEditor 5**. Content is edited directly within the page's visual context — editors see exactly what the published page will look like.

### Rich Text Formatting

- Headings (H1–H6) with paragraph conversion
- Bold, italic, underline, strikethrough
- Bulleted and numbered lists
- To-do / checklist items
- Blockquotes
- Code blocks (preformatted)
- Indent / outdent for list and paragraph nesting

### Link Management

- Internal page links — link to other SkyCMS-managed pages by title search
- External URL links
- File links — link to downloadable files stored in File Manager
- Link editing and removal

### Media Insertion

- **Image insertion** with three sources:
  - Upload from computer (direct file picker)
  - Select from File Manager / website storage
  - Paste external image URL
- Alt text support for accessibility
- Image widget mode with dedicated toolbar
- **Video embeds** — YouTube, Vimeo, and other oEmbed-compatible providers
- **Media embed** — paste a URL and CKEditor auto-embeds the preview

### Table Support

- Insert and configure tables
- Row/column add/remove
- Cell merging
- Table styling and alignment

### Editable Regions

- Content is organized into **editable regions** identified by stable `data-ccms-ceid` attributes
- Each region can have its own toolbar profile
- Regions are defined by the template and preserved across template updates
- Supported container elements: `<div>`, `<section>`, `<article>`, `<aside>`, `<main>`, `<header>`, `<footer>`, and headings `<h1>`–`<h6>`

### Toolbar Profiles

Templates control which toolbar each editable region uses:

| Profile | Purpose | Key Tools |
| --------- | --------- | ----------- |
| `title` | Headings only | Bold, italic, underline |
| `simple` | Basic formatting | Headings, bold, italic, lists, links, quotes, undo/redo |
| `standard` | General content | All of simple + file links, images, media embeds, tables, to-do lists |
| `advanced` | Full control | All tools including code blocks, indent/outdent |
| `image-widget` | Image-only regions | Image insertion and alt-text editing |

### Save Behavior

- **Auto-save** after an idle period (configurable)
- **Manual save** via Ctrl+S / Cmd+S
- Save status indicator in toolbar ("Saved" / "Saving...")
- Last-published timestamp displayed in toolbar

> **Documentation:**
>
> - [Visual Editor](../../for-editors/page-editor.md)
> - [Visual Editor Quickstart](../../for-editors/page-editor-quickstart.md)
> - [Visual Editor Toolbar Reference](../../for-editors/page-editor-toolbar-reference.md)
> - [Visual Editor Visual Guide](../../for-editors/page-editor-visual-guide.md)
> - [Visual Editor Technical Reference](../../for-editors/page-editor-technical-reference.md)

---

## 2. Page Builder (Visual Drag-and-Drop)

A visual composition tool built on **GrapesJS** for building page layouts, templates, and article designs without writing code.

### Canvas & Composition

- WYSIWYG drag-and-drop canvas
- Real-time visual preview of changes
- Layer panel showing component hierarchy
- Component selection, move, copy, and delete
- Undo / redo

### Block Library

Pre-built component blocks organized by category:

- **SkyCMS** — SkyCMS-specific blocks and Cosmos CMS legacy blocks
- **Blog** — Blog stream and blog post components
- **Contact** — Contact forms and CTA elements
- **Content** — Text, headings, paragraphs, lists
- **CTA** — Call-to-action sections
- **Commerce** — Product/pricing components
- **Features** — Feature showcases and grids
- **Footer** — Footer layouts
- **Gallery** — Image galleries
- **Header** — Header/navigation components
- **Hero** — Hero sections with backgrounds
- **Pricing** — Pricing tables and comparisons
- **Statistics** — Data visualization blocks
- **Steps** — Step-by-step process layouts
- **Team** — Team member profiles
- **Testimonials** — Testimonial/review sections
- **Extra** — Additional utility blocks
- **Basic** — Fundamental HTML elements

### Style Manager

- Spacing controls (margin, padding)
- Typography (font family, size, weight, color, line height, letter spacing)
- Dimension controls (width, height, min/max)
- Color and background settings
- Border and border-radius
- Display and position properties

### Responsive Design

- Multi-breakpoint preview: desktop, tablet, mobile
- Per-breakpoint style overrides
- Responsive layout validation

### Asset Management

- Integrated asset manager for images and media
- Upload assets directly from the builder interface
- Browse existing assets from storage

### Import / Export

- Import raw HTML/CSS into the builder
- Export HTML/CSS from the builder
- Framework-aware: detects Bootstrap and Tailwind classes and provides matching block sets

### AI Assistant Use Cases

- **Layouts** — Creating site-wide header/footer/navigation shells
- **Templates** — Building reusable page structures with editable regions
- **Articles** — Composing individual page designs (Page Builder mode)

> **Documentation:**
>
> - [Page Builder](../../for-editors/page-builder.md)
> - [Layers Panel](../../for-editors/layers.md)
> - [Page Builder Quickstart](../../for-editors/page-builder-quickstart.md)

---

## 3. Code Editor

A professional code editing experience built on **Monaco Editor** (the same engine as VS Code), for editors who prefer direct HTML/CSS/JavaScript control.

### Editor Capabilities

- Full syntax highlighting for HTML, CSS, JavaScript, JSON, XML
- IntelliSense / auto-completion
- Multi-cursor editing
- Find and replace (with regex support)
- Code folding
- Bracket matching
- Minimap navigation
- Line numbers and go-to-line
- Diff viewer for comparing versions

### Emmet Support

- Emmet abbreviation expansion for:
  - HTML
  - Razor templates
  - Handlebars
  - CSS, SCSS, LESS

### Multi-Field Editing

- Edit multiple content fields (Head Block, Html Content, Footer Block) via tabbed interface
- Active field tracking and dirty-flag detection per field
- Independent save state per field

### Keyboard Shortcuts

Full VS Code-compatible shortcut set including:

- Copy / paste / cut
- Undo / redo
- Find / find and replace
- Select all / select line
- Move line up / down
- Duplicate line
- Toggle comment
- Indent / outdent
- Multi-cursor (Alt+Click, Ctrl+D)
- Go to line (Ctrl+G)

### Theme Support

- Dark and light editor themes
- Consistent with SkyCMS dark UI

### Used For

- **Articles** — Direct HTML editing of page content
- **Layouts** — HTML/CSS editing of site-wide structure
- **Templates** — HTML editing with editable region markup
- **File Manager** — Editing code files (.html, .css, .js, .json, .xml, .txt) stored in cloud storage

> **Documentation:**
>
> - [Code Editor](../../for-editors/code-editor.md)

---

## 4. AI Assistant Integration

A tenant-aware AI assistant shared across Monaco, CKEditor, and the standalone AI Help Chat.

### Inline Code Completions

- Ghost-text suggestions as you type
- Context-aware: understands the language being edited (HTML, CSS, JS, etc.)
- Tab to accept suggestion, continue typing to dismiss
- Works within the Monaco code editor across all editing contexts

### Chat Interface

- Conversational AI assistant within the editor
- Ask questions about code, request generation, or get explanations
- Model selection when supported by the configured provider
- Detach link to open the standalone AI Help Chat

### CKEditor AI Writing Assistant

- Region-scoped rich-text AI authoring inside the Visual Editor
- Improve selection, rewrite content, and replace the active block
- Model selection when supported by the configured provider

### AI Help Chat

- Standalone AI help workspace launched from the editor menu
- General help mode for SkyCMS and website guidance
- Site-help mode for questions that should use current page/site context
- Docked or detached usage

### Configuration (Admin-Managed)

- Global enable/disable per tenant
- **Endpoint flexibility** — works best with OpenAI-compatible chat-completions providers such as GitHub Models, OpenAI, Azure OpenAI, Ollama, and compatible gateways
- Discovery states for live catalog, inferred deployment, unsupported, failed, and additional-configuration-needed paths
- Access token management (masked after save, rotation supported)
- Tuning parameters:
  - Temperature (0–2, default 0.2)
  - Max tokens per completion (16–1,024)
  - Timeout (1,000–60,000 ms)
- Status endpoint for client-side feature discovery
- Model catalog endpoint for provider-aware model picker loading
- Per-user model preferences scoped by provider and editor context
- Rate limiting on completion and chat endpoints

> **Documentation:**
>
- - [AI Assistant](../../for-editors/ai-assistant.md)
- - [AI Provider Setup](../../for-editors/ai-provider-setup.md)
- - [AI Troubleshooting](../../for-editors/ai-troubleshooting.md)
- - [AI Configuration Overview](../../configuration/ai/overview.md)
- - [AI Integration Architecture](../../for-developers/ai-integration.md)

---

## 5. Image Editor

A comprehensive in-browser image editing suite built on **Filerobot Image Editor**, accessible from the File Manager.

### Editing Tools

| Tool | Description |
| ------ | ------------- |
| **Crop** | Freeform, fixed aspect ratios (1:1, 4:3, 16:9, 21:9), social media presets |
| **Rotate** | Free rotation and 90° increments |
| **Flip** | Horizontal (Flip X) and vertical (Flip Y) |
| **Resize** | Custom dimensions, social media presets, aspect ratio lock |

### Adjustments & Filters

- **Adjust** — Brightness, contrast, exposure, saturation, hue, shadows, highlights, warmth
- **Fine Tune** — RGB channel control, gamma, color curves
- **Filters** — Vintage, sepia, grayscale, blur, sharpen, and custom filter presets

### Annotation

- Text overlays with font, size, and color options
- Shapes: rectangle, circle, triangle, polygon
- Arrows and lines
- Freehand drawing
- Positioning and opacity controls

### Watermarking

- Text watermarks with customizable font, size, position, and opacity
- Image watermarks with positioning and opacity controls

### Workflow

- Undo / redo support
- Keyboard shortcuts (Ctrl+Z undo, Ctrl+Shift+Z redo, Ctrl+S save)
- Save back to original location in cloud storage
- Accessibility metadata support (alt text)

> **Documentation:**
>
> - [Image Editing](../../for-editors/image-editing.md)

---

## 6. Real-Time Collaborative Editing

SignalR-powered real-time communication between editors working on the same content.

### Live Editing Notifications

- Join/leave notifications when editors open the same article
- Save notifications broadcast to all editors viewing the page
- Typing indicators

### Article Locking

- Lock an article while editing to prevent conflicts
- Unlock when editing is complete
- Lock status visible to other editors

### Live Editor Hub

- Multi-user editing groups per article
- Real-time update broadcasting between editors
- Editor presence awareness

### Region-Level Save

- Save individual editable regions independently via SignalR
- Granular save operations without full-page submission

> **Documentation:**
>
> - [Collaborative Editing Guide](../../for-editors/collaborative-editing.md)
