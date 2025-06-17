# WaracleDevOpsChallenge – AWS Static Website with Terraform & GitHub Actions

## Project Overview

- **Cloud Platform:** AWS  
- **IaC Tool:** Terraform  
- **CI/CD Tool:** GitHub Actions  
- **Output:** Provision an S3 bucket configured to serve a static website hosting the index.html file with public read access.

## Structure

.
├── .github/
│ └── workflows/
│   ├── deploy.yml # GitHub Actions pipeline
├── terraform/
│ ├── main.tf # AWS S3 bucket creation and static website hosting setup
│ ├── variables.tf # Input variables for bucket name, region, etc.
│ ├── outputs.tf # Output values (e.g., website endpoint URL)
├── index.html # Simple webpage to be served
├── README.md # Project overview and pipeline explanation
└── design.md # Infrastructure design rationale

## How to Use

> **Note:** This project is not intended to be deployed directly as part of this challenge.

To test it locally (if desired):

```bash
cd terraform
terraform init
terraform plan
# terraform apply  # (Optional and not required)
```

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

- Add CloudFront CDN in front of S3 for SSL and better performance
- Include testing or monitoring hooks
- Extend the pipeline for multi-environment workflows
- Add automated cache invalidation on deploy
- Support multi-file sync or upload with versioning

## Documentation

- design.md — Contains architectural rationale and tool selection
- deploy.yml — CI/CD pipeline definition

## Output

After deployment, Terraform will output the bucket website URL. This can be used to verify the static page is accessible.

``` makefile
Outputs:
static_website_url = "http://your-bucket-name.s3-website-eu-west-1.amazonaws.com"
```
