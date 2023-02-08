# For test deployment only

An example project for testing deploy application to Podman or Kubernetes cluster.

## Usage

1. Using Terraform to deploy application to cluster

    - Rename `terraform.tfvars.example` into `terraform.tfvars` in `terraform` folder.
    - Change variables value into specify value.
    - Issue `terraform init` and `terraform apply --auto-approve` to deploy
    - Done
