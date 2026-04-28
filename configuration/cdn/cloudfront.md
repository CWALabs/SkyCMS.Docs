---
canonical_title: CDN: CloudFront
description: Configure CloudFront invalidation for SkyCMS publish workflows in AWS-backed environments.
doc_type: How-to
product_area: configuration
user_intent: configure-skycms-cloudfront-invalidation
audience:
	- DevOps
	- Administrators
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# CDN: CloudFront

## Summary

Use CloudFront when hosting behind AWS edge distributions and you want automated invalidations after content publish.

## Outcome

After completing this guide, SkyCMS will trigger CloudFront cache invalidations on publish using the configured IAM credentials and distribution ID.

## Required settings

- distribution ID,
- IAM access key and secret,
- region (commonly `us-east-1` for CloudFront API operations),
- IAM policy allowing create and get invalidation on target distribution.

## Routing and cache rules

Recommended rules:

- invalidate only affected paths when possible,
- use least-privilege IAM policies per distribution,
- monitor invalidation volume and propagation delay.

## Validation checklist

- credentials pass save or test,
- invalidation entries appear in CloudFront console after publish,
- refreshed content reaches edge locations as expected.

## Related guides

- [CDN Overview](./overview.md)
- [CloudFront IAM Credentials](./aws-cloudfront-iam-credentials.md)
- [CDN Configuration Reference](./configuration-reference.md)
