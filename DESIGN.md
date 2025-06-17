# Design Overview – DevOps Technical Assignment

## Cloud Platform Selection

**AWS** was chosen due to its maturity, extensive Terraform support, and widespread industry adoption.

## Infrastructure Components (Updated)

- **S3 Bucket** configured for static website hosting:
  - Provides cost-effective, highly available, and scalable static content delivery.
  - Eliminates the need for managing EC2 instances or web servers.
- **Bucket Policy**:
  - Configured for public read access to serve content securely.
- **Terraform**:
  - Maintains reproducible, modular, and declarative infrastructure.
  - Facilitates easy future expansion (e.g., CloudFront integration, Route53 DNS).

## Why S3 Over EC2?

For hosting a single static HTML page, EC2 is overprovisioned and operationally heavier:

- S3 offers a serverless, maintenance-free solution.
- Removes patching, security group management, and bootstrapping complexity.
- Supports direct integration with CloudFront for HTTPS and global caching.

## CI/CD Pipeline

**GitHub Actions** was selected for:

- Native integration with GitHub repositories.
- Simplified pipeline setup and free tier usage.
- Easy extensibility for future deployment steps.

### Pipeline Stages

1. **Checkout Code:** Retrieves the Terraform configuration and website files.
2. **Terraform Init:** Initializes the provider and backend.
3. **Terraform Plan:** Validates and previews infrastructure changes.
4. **Terraform Apply (Simulated):** Placeholder to mimic deployment without side effects.
5. **Feedback:** Provides deployment status messages.

This setup simulates a production-grade workflow and can be extended for real deployment, multi-environment workflows, and secret management.

## Considerations

- In production, Terraform state should be remotely managed with locking.
- AWS credentials must never be hardcoded; use GitHub Secrets.
- Enabling CloudFront for HTTPS and custom domains is recommended for a production-ready site.

---

This migration from EC2 to S3 significantly simplifies infrastructure, reduces costs, and aligns with best practices for static website hosting on AWS.