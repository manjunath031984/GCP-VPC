# GCP Terraform Project - Modular VPC and Compute

This project provisions a production-ready baseline on Google Cloud Platform using reusable Terraform modules.

## Provisioned Infrastructure

- Custom VPC: `GCP-VPC`
- Public subnet: `192.168.0.0/24` in `us-central1`
- Ingress firewall rules:
  - SSH (22)
  - HTTP (80)
  - HTTPS (443)
  - ICMP
- Compute Engine VM:
  - Machine type: `e2-micro`
  - Image: Ubuntu 26.04 LTS Minimal (`ubuntu-minimal-2604-lts` family)
  - Boot disk: 20 GB `pd-standard`
  - External public IP enabled
  - OS Login metadata enabled
  - Serial port and serial logging enabled
  - Apache installation via startup script

## Authentication

No credentials are hardcoded in Terraform.

Terraform Google provider automatically uses the `GOOGLE_APPLICATION_CREDENTIALS` environment variable.

This matches the existing Jenkins step:

```groovy
withCredentials([file(credentialsId: 'gcp-sa-key', variable: 'GOOGLE_APPLICATION_CREDENTIALS')])
```

## Project Structure

```text
GCP-VPC/
├── provider.tf
├── versions.tf
├── variables.tf
├── GCP-VPC.tfvars
├── outputs.tf
├── main.tf
├── startup.sh
├── README.md
└── modules/
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── compute/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Terraform Version and Provider

- Terraform: `1.13.x` (`required_version = "~> 1.13.0"`)
- Provider: `hashicorp/google` latest stable (version intentionally not pinned)

## Usage

Run from the repository root:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -var-file="GCP-VPC.tfvars"
terraform apply -var-file="GCP-VPC.tfvars"
```

Destroy when needed:

```bash
terraform destroy -var-file="GCP-VPC.tfvars"
```

## Jenkins Compatibility

The project is compatible with a pipeline that runs:

- checkout
- GCP auth with `gcp-sa-key`
- `terraform fmt`
- `terraform init`
- `terraform validate`
- `terraform plan`
- manual approval
- `terraform apply`
- `terraform destroy`

No additional credentials or environment variables are required.

## Outputs

Root outputs include:

- VPC Name
- VPC ID
- Subnet Name
- Subnet CIDR
- VM Name
- VM ID
- Internal IP
- External IP
- Self Link
- Network Name
