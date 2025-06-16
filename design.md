# Design Document

## Cloud Provider

**AWS** was chosen for its maturity, widespread usage, and robust Terraform support. The `t2.micro` EC2 instance offers a free-tier eligible, lightweight compute option ideal for simple web hosting.

## Infrastructure Components

- **EC2 Instance**: Hosts the static web page via NGINX.
- **Security Group**: Allows public access to port 80 for HTTP traffic.
- **User Data Script**: Installs and starts NGINX, then writes `index.html` to the correct path.

## CI/CD Pipeline

- **Tool**: GitHub Actions
- **Stages**:
  - Checkout code
  - Initialize Terraform
  - Plan infrastructure
  - Simulate apply with a placeholder command
  - Output result of the simulation

This pipeline enables future automation and infrastructure testing workflows while remaining safe for demonstration purposes.
