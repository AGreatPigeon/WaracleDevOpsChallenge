# WaracleDevOpsChallenge – AWS Static Website with Terraform & GitHub Actions

## Project Overview

This project provisions a **basic compute instance** on AWS (EC2) to serve a static web page, following Infrastructure as Code (IaC) and CI/CD best practices.

- **Cloud Provider**: AWS (eu-west-1)
- **Compute Instance**: Amazon EC2 with Amazon Linux 2
- **Web Server**: NGINX
- **Automation**: Terraform + GitHub Actions
- **CI/CD**: Simulates a deployment pipeline with `terraform init` and `terraform plan`

> Note: Infrastructure is provisioned but not deployed as per challenge guidelines.

## How to Use

> **Note:** This project is not intended to be deployed directly as part of this challenge.

To test it locally (if desired):

```bash
cd terraform
terraform init
terraform plan
# terraform apply  # (Optional and not required)
```

## How It Works

1. **Terraform** provisions:
   - An EC2 instance
   - A security group allowing HTTP (port 80)
   - Bootstrap script to install and start NGINX

2. **CI/CD Pipeline** (`.github/workflows/deploy.yml`) simulates:
   - Terraform init
   - Terraform plan
   - Placeholder apply (not executed)

3. **Static Site** is served from the EC2 instance once provisioned.

## CI/CD Pipeline Explained

This project uses GitHub Actions to simulate an infrastructure deployment workflow using Terraform. The workflow file is:

.github/workflows/deploy.yml

## Pipeline Stages

| Step | Description |
| ---- | ----------- |
| checkout | Checks out the repository |
| setup-terraform | Installs Terraform via GitHub Actions |
| terraform init | Initializes providers and backend |
| terraform plan | Generates and shows an execution plan |
| terraform apply (simulated) | Placeholder that mimics apply without making changes |
| report result | Prints a deployment success message |

## Real Deployment Scenario

If this pipeline were set up to deploy real infrastructure, the following commands would be used:

``` bash
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply -auto-approve tfplan
```

The apply step would be gated for approval in production, or restricted to specific environments.

Replace the simulated apply with:

``` yaml
- name: Terraform Apply
  run: terraform apply -auto-approve tfplan
```

## Secrets and Remote State (In Production)

In a production setting:

- Secrets like AWS credentials would be stored in GitHub Actions Secrets:
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY

- Terraform state would be stored in an S3 backend with locking via DynamoDB, to prevent concurrent modifications.

Example backend block:

``` hcl
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "devops-assignment/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}
```

## Future Enhancements

- Add terraform fmt and validate checks
- Include testing or monitoring hooks
- Extend the pipeline for multi-environment workflows
- Use modules for reusable infrastructure components

## Documentation

- design.md — Contains architectural rationale and tool selection
- deploy.yml — CI/CD pipeline definition

## Output

After deployment, Terraform will output the EC2 instance’s public IP. This can be used to verify the static page is accessible via browser on port 80.

``` makefile
Outputs:
instance_public_ip = "3.XX.XXX.XX"
```
