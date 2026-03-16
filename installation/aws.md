<!-- Audience: DevOps -->
<!-- Type: How-to -->
<!-- Status: Draft -->
<!-- Source: SkyCMS/Docs/Installation/AWSInstall.md -->

# Install on AWS

## When to use this page

Use this guide when deploying SkyCMS on AWS with the interactive CDK script or a manual S3-backed setup.

## Prerequisites

- AWS account and IAM permissions for CloudFormation, ECS, RDS, S3, CloudFront, IAM, Secrets Manager, ACM, and EC2.
- AWS CLI configured.
- Node.js and npm.
- Docker.
- PowerShell.

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

## Troubleshooting

- CDK deploy fails: confirm permissions and AWS CLI identity.
- CloudFront not reachable: wait for distribution propagation.
- Email issues with SES: verify sender identity and sandbox restrictions.
- Storage failures: verify `Bucket`, `Region`, `KeyId`, and `Key` values.

## Related guides

- [minimum-required-settings.md](minimum-required-settings.md)
- [setup-wizard.md](setup-wizard.md)
- [post-installation.md](post-installation.md)
- [../configuration/storage/s3.md](../configuration/storage/s3.md)
- [../configuration/email/overview.md](../configuration/email/overview.md)
