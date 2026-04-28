---
canonical_title: Install on AWS
description: Deploy SkyCMS on AWS with the interactive CDK-based workflow or a manual S3-backed setup path.
doc_type: How-to
product_area: installation
user_intent: install-skycms-on-aws
audience:
	- DevOps
difficulty: intermediate
version: current
status: active
owner: docs-platform
last_reviewed: 2026-04-27
---

# Install on AWS

## Summary

Use this guide when deploying SkyCMS on AWS with the interactive CDK script or a manual S3-backed setup.

## Prerequisites

- AWS account and IAM permissions for CloudFormation, ECS, RDS, S3, CloudFront, IAM, Secrets Manager, ACM, and EC2.
- AWS CLI configured.
- Node.js and npm.
- Docker.
- PowerShell.

## Outcome

After completing this guide, SkyCMS should be deployed on AWS, the setup wizard should be finished, and storage or publisher integrations should be working for the selected path.

## Recommended path: interactive CDK deployment

From the SkyCMS repository:

```powershell
cd InstallScripts/AWS
./cdk-deploy.ps1
```

The script prompts for:

- Region and stack names.
- Editor deployment settings.
- Optional custom domains.
- Optional Publisher deployment (S3 + CloudFront).
- Optional SES SMTP settings.

## Post-deployment steps

1. Open the Editor URL from deployment output.
2. Complete setup at `/___setup`.
3. Verify upload and publishing flows.
4. If Publisher stack was enabled, sync website assets to S3.

## Manual S3-only option

If you only need object storage integration:

1. Create S3 bucket.
2. Create IAM user/access keys with least-privilege S3 access.
3. Set `ConnectionStrings__StorageConnectionString` using S3 format.
4. Continue with standard setup wizard flow.

## Verification

This installation is complete when the editor is reachable, setup finishes successfully, uploads work, and published output is reachable through the expected AWS path.

## Troubleshooting

- CDK deploy fails: confirm permissions and AWS CLI identity.
- CloudFront not reachable: wait for distribution propagation.
- Email issues with SES: verify sender identity and sandbox restrictions.
- Storage failures: verify `Bucket`, `Region`, `KeyId`, and `Key` values.

## Related guides

- [Minimum Required Settings](minimum-required-settings.md)
- [Setup Wizard](setup-wizard.md)
- [Post-Installation Configuration](post-installation.md)
- [Amazon S3 Storage](../configuration/storage/s3.md)
- [Email Overview](../configuration/email/overview.md)
