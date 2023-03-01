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
- [實作開源小工具，與 Github Actions 的第一次相遇！](https://medium.com/starbugs/%E5%AF%A6%E4%BD%9C%E9%96%8B%E6%BA%90%E5%B0%8F%E5%B7%A5%E5%85%B7-%E8%88%87-github-actions-%E7%9A%84%E7%AC%AC%E4%B8%80%E6%AC%A1%E7%9B%B8%E9%81%87-3dd2d70eeb)
- [Workflow syntax for GitHub Actions](https://docs.github.com/zh/actions/using-workflows/workflow-syntax-for-github-actions)
- [使用指令碼在執行器上測試程式碼](https://docs.github.com/zh/actions/examples/using-scripts-to-test-your-code-on-a-runner)
- [How to use GitHub Actions environment variables](https://snyk.io/blog/how-to-use-github-actions-environment-variables/)
