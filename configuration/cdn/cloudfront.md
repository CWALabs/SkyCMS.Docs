<!-- Audience: DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Configuration/CDN-CloudFront.md -->

# CDN: CloudFront

## When to use CloudFront

Use CloudFront when hosting behind AWS edge distributions and you want automated invalidations after content publish.

## Required settings

- distribution ID,
- IAM access key and secret,
- region (commonly `us-east-1` for CloudFront API operations),
- IAM policy allowing create/get invalidation on target distribution.

## Routing and cache rules

Recommended rules:

- invalidate only affected paths when possible,
- use least-privilege IAM policies per distribution,
- monitor invalidation volume and propagation delay.

## Validation checklist

- credentials pass save/test,
- invalidation entries appear in CloudFront console after publish,
- refreshed content reaches edge locations as expected.

## Related guides

- [CDN Overview](./overview.md)
- [CDN Configuration Reference](./configuration-reference.md)
