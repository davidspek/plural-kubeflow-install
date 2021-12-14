metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:7XHIOYhwg6qhfHOW8Zj1SOrqojh5pE/6j/MsBnex/tc="
  retries = 0
}

step "terraform" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "mlflow",
  ]

  sha     = "h1:7XHIOYhwg6qhfHOW8Zj1SOrqojh5pE/6j/MsBnex/tc="
  retries = 0
}

step "kube-init" {
  wkdir   = "mlflow"
  target  = "mlflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mlflow",
  ]

  sha     = "79723b2bf1c4c7cdf2d2cdf87407e82b894b23bba48927a6ae399bc8e10b9d8f"
  retries = 0
}

step "helm" {
  wkdir   = "mlflow/helm"
  target  = "mlflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "mlflow",
  ]

  sha     = "h1:fSzZhj2Q1n55RJ6piHd8BK8eXnmT7luQtUFZaU3+LVQ="
  retries = 0
}
