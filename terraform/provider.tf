terraform {
  required_version = ">= 1.3"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.17.0"
    }
  }

  backend "local" {
    path = "/tmp/terraform.tfstate"
  }
}

provider "kubernetes" {
  host = var.kubernetes_path
  insecure = true
  config_path = "~/.kube/config"
}
