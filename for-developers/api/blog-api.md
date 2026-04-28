---
canonical_title: Blog API Reference
description: JSON API endpoints for programmatic access to SkyCMS blog data.
doc_type: Reference
product_area: development
user_intent: reference-blog-api-endpoints
audience:
  - Developers
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-28
---

# Blog API Reference

## Summary

JSON API endpoints for programmatic access to SkyCMS blog data.

## Overview

The Blog API provides read-only JSON endpoints for listing blog streams and their entries. These endpoints are used by the editor UI for table population and can be used by custom integrations.

> **Note:** All blog API endpoints require authentication (`[Authorize]`). There is currently no public/anonymous blog API for headless or front-end consumption.

---

## Endpoints

### List Blog Streams

Returns all blog streams (excluding deleted).

```
GET /editor/blogs/GetBlogs
```

**Authentication:** Required

**Response:** `200 OK` — JSON array of blog stream objects.

```json
[
  {
    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "blogKey": "engineering",
    "title": "Engineering Blog",
    "description": "Technical articles from the engineering team",
    "heroImage": "/images/eng-banner.jpg",
    "urlPath": "engineering",
    "published": "2025-06-15T10:00:00+00:00"
  }
]
```

**Response Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `id` | GUID | Blog stream unique identifier |
| `blogKey` | string | URL-safe identifier (pattern: `^[a-z0-9-_]+$`) |
| `title` | string | Display title (max 128 chars) |
| `description` | string | Summary text (max 512 chars) |
| `heroImage` | string | Banner image URL (may be null) |
| `urlPath` | string | URL path for the stream |
| `published` | DateTimeOffset? | Publication date (null if draft) |

---

### List Blog Entries

Returns all entries (posts) for a specific blog stream.

```
GET /editor/blogs/{blogKey}/getentries
```

**Authentication:** Required

**Parameters:**

| Parameter | In | Type | Description |
|-----------|----|------|-------------|
| `blogKey` | path | string | Blog stream identifier |

**Response:** `200 OK` — JSON array of blog entry objects.

```json
[
  {
    "blogKey": "engineering",
    "articleNumber": 42,
    "title": "Getting Started with SkyCMS",
    "published": "2025-07-01T14:00:00+00:00",
    "updated": "2025-07-02T09:30:00+00:00",
    "urlPath": "engineering/getting-started-with-skycms",
    "introduction": "A quick guide to building your first site with SkyCMS.",
    "bannerImage": "/images/quickstart.jpg"
  }
]
```

**Response Fields:**

| Field | Type | Description |
|-------|------|-------------|
| `blogKey` | string | Parent blog stream key |
| `articleNumber` | int | Article number (used for edit/delete operations) |
| `title` | string | Post title (max 254 chars) |
| `published` | DateTimeOffset? | Publication date (null if draft) |
| `updated` | DateTimeOffset | Last modification timestamp |
| `urlPath` | string | Full post URL path (`{blogKey}/{slug}`) |
| `introduction` | string | Excerpt/summary (max 512 chars, may be null) |
| `bannerImage` | string | Banner image URL (may be null) |

---

### Preview Blog Stream

Renders an HTML preview of a blog stream. This is the only anonymous blog endpoint.

```
GET /editor/blogs/{blogKey}/preview
```

**Authentication:** Not required (`[AllowAnonymous]`)

**Parameters:**

| Parameter | In | Type | Description |
|-----------|----|------|-------------|
| `blogKey` | path | string | Blog stream identifier |

**Response:** `200 OK` — HTML page rendering the blog stream.

**Response:** `404 Not Found` — Blog stream does not exist.

---

## URL Patterns

### Blog Stream URLs

```
/{blogKey}
```

Example: `/engineering`

### Blog Post URLs

```
/{blogKey}/{post-slug}
```

Example: `/engineering/getting-started-with-skycms`

### Blog Key Format

- Pattern: `^[a-z0-9-_]+$`
- Only lowercase letters, digits, hyphens, and underscores
- Maximum 64 characters (validation), stored up to 128 characters
- Must be unique per site

---

## Data Model

Blog streams and posts are stored as `Article` entities with the `ArticleType` field distinguishing them:

| ArticleType Value | Meaning |
|-------------------|---------|
| `0` | General page |
| `1` | Blog Post |
| `2` | Blog Stream |
| `3` | SPA Application |

The `BlogKey` field on the `Article` entity groups posts with their parent stream. All blog queries filter by `ArticleType` and `BlogKey`.

---

## See Also

- [Blogging Guide (Editors)](../../for-editors/blogging.md) — Editor-facing blogging guide
- [Blog Architecture](../blog-architecture.md) — Technical internals
- [API Overview](overview.md) — General API documentation
