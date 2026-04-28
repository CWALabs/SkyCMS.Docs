---
canonical_title: Setup Wizard Step 3 Publisher Settings
description: Set the public URL and publishing behavior that control how SkyCMS renders and exposes content.
doc_type: How-to
product_area: installation
user_intent: configure-publisher-settings-during-setup
audience:
	- Developers
	- Administrators
difficulty: beginner
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Setup Wizard: Step 3 Publisher Settings

## Summary

Configure public URL and publishing behavior.

## Outcome

After completing this step, the public URL and publishing behavior will be set so SkyCMS can generate correct output paths on first publish.

## Steps

1. Enter the public URL for your site (e.g., `https://www.example.com`).
2. Choose static or dynamic publishing mode based on your intended site architecture.
3. Configure authentication requirements and allowed file types as needed.
4. Click **Continue** when the URL and publishing settings are confirmed.

## Key fields

- `PublisherUrl`
- Website title
- Static website mode
- Authentication requirement
- Allowed file types

## Environment variable pre-configuration

- `CosmosPublisherUrl`
- `CosmosStaticWebPages`
- `CosmosRequiresAuthentication`
- `AllowedFileTypes`

## Notes

- For public websites, keep authentication disabled unless private access is required.
- Restrict file type allowlist to required formats.

## Verification

This step is complete when the public URL is correct for the environment, publishing options match your intended site mode, and the wizard allows you to continue.

## Next step

Proceed to [Setup Wizard: Step 4 Email](setup-wizard-step4-email.md).

## Related guides

- [Configuration Overview](../configuration/overview.md)
- [Post-Installation Configuration](post-installation.md)
