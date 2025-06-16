# Design Overview – DevOps Technical Assignment

## ☁️ Chosen Cloud Platform

**AWS** was selected for its wide industry adoption, developer familiarity, and seamless Terraform support.

### Infrastructure Components

- **EC2 Instance** (t2.micro): Chosen for cost-efficiency and suitability for lightweight web workloads.
- **Security Group**: Allows ingress on port 80 for HTTP traffic.
- **User Data Script**: Installs NGINX and deploys a static HTML page at boot.

## 🛠️ IaC Tool

**Terraform** was used to:

- Keep the infrastructure reproducible and modular
- Ensure consistent environment setup
- Make future automation or expansion (e.g., S3 hosting, CloudFront, Route53) trivial

### Why not Docker/Kubernetes?

For this use case — a single static HTML file — Kubernetes would be excessive. It introduces overhead (cluster setup, Docker image build, service definitions) without adding meaningful value for this scope. Terraform provides a leaner, more purpose-aligned solution.

## ⚙️ CI/CD Pipeline

**GitHub Actions** was chosen for its tight integration with source control, simplicity, and free usage for public repositories.

### Pipeline Stages:

1. **Checkout Code**: Retrieves the IaC configuration and index.html
2. **Terraform Init**: Initializes the backend and providers
3. **Terraform Plan**: Validates the configuration and prints expected changes
4. **Terraform Apply (Simulated)**: Placeholder command shown, not executed
5. **Feedback**: Final echo message indicating simulated deployment success

This mirrors a real-world deployment pipeline and provides a solid foundation for enhancement (e.g., test environments, S3 backend, policy validation).
