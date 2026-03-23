# Module Manifest Specification

## File Name
`module.manifest.json`

## Purpose
Defines module identity, compatibility, permissions, menu contributions, server registration, and frontend assets.

## Proposed Schema (v1)

```json
{
  "$schema": "https://skycms.dev/schemas/module-manifest.v1.json",
  "manifestVersion": "1.0",
  "id": "contoso.forms",
  "name": "Contoso Forms",
  "version": "1.2.0",
  "publisher": {
    "name": "Contoso",
    "id": "contoso",
    "signatureThumbprint": "ABCD1234..."
  },
  "description": "Custom form workflows for Editor",
  "minEditorVersion": "2.4.0",
  "maxEditorVersion": "2.x",
  "hostApiVersion": "1.x",
  "entryAssembly": "server/Contoso.Forms.Module.dll",
  "entryType": "Contoso.Forms.ModuleStartup",
  "capabilities": [
    "menu:contribute",
    "routes:mvc",
    "assets:serve",
    "http:outbound"
  ],
  "dependencies": [
    {
      "id": "contoso.common",
      "versionRange": ">=1.0.0 <2.0.0"
    }
  ],
  "menu": [
    {
      "id": "contoso.forms.root",
      "label": "Forms",
      "location": "main.manage",
      "order": 520,
      "icon": "fa-solid fa-file-signature",
      "route": "/modules/contoso.forms/forms",
      "rolesAny": ["Administrators", "Editors"],
      "tenants": ["*"],
      "featureFlag": "Modules.ContosoForms"
    }
  ],
  "frontend": {
    "scripts": [
      "/modules/contoso.forms/js/forms-shell.js"
    ],
    "styles": [
      "/modules/contoso.forms/css/forms-shell.css"
    ]
  },
  "integrity": {
    "packageSha256": "...",
    "files": [
      {
        "path": "server/Contoso.Forms.Module.dll",
        "sha256": "..."
      },
      {
        "path": "wwwroot/js/forms-shell.js",
        "sha256": "..."
      }
    ]
  }
}
```

## Required Fields

1. `manifestVersion`
2. `id`
3. `name`
4. `version`
5. `publisher`
6. `minEditorVersion`
7. `hostApiVersion`
8. `entryAssembly`
9. `entryType`

## Optional Fields

1. `maxEditorVersion`
2. `description`
3. `capabilities`
4. `dependencies`
5. `menu`
6. `frontend`
7. `integrity`

## Validation Rules

1. Identity and version
- `id` must be lowercase, dot-separated namespace style.
- `version` must be semantic versioning.

2. Compatibility
- Host must satisfy editor and host API version constraints.

3. Capabilities
- Unknown capability values fail validation.
- Restricted capabilities require explicit admin approval.

4. Menu
- `location` must be in approved values.
- `route` must be app-relative and module-owned.
- Duplicate `id` across installed modules is rejected.

5. Integrity
- If `integrity` is present, all hashes must validate.
- Signature thumbprint must match package signature chain.

## Allowed Menu Locations (Initial)

1. `main.manage`
2. `main.tools`
3. `main.settings`

## Example Minimal Manifest

```json
{
  "manifestVersion": "1.0",
  "id": "sample.hello",
  "name": "Hello Module",
  "version": "1.0.0",
  "publisher": {
    "name": "Sample Org",
    "id": "sample"
  },
  "minEditorVersion": "2.4.0",
  "hostApiVersion": "1.x",
  "entryAssembly": "server/Sample.Hello.Module.dll",
  "entryType": "Sample.Hello.ModuleStartup"
}
```
