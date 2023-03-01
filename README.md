# For test deployment only

An example project for testing deploy application to Podman or Kubernetes cluster.

## Usage

1. Using Terraform to deploy application to cluster

    - Rename `terraform.tfvars.example` into `terraform.tfvars` in `terraform` folder.
    - Change variables value into specif value.
    - Issue `terraform init` and `terraform apply --auto-approve` to deploy
    - Done
2. Using kubectl to deploy application to cluster
    - Modify `kubernetes/deployment.yaml`.
    - Issue `kubectl apply -f deployment.yaml`
    - Done

## References

- [How to prevent GitHub Actions workflow being triggered by a forked repository events?](https://stackoverflow.com/a/73146898)
- [Stop github actions running on a fork](https://github.com/orgs/community/discussions/26704)
