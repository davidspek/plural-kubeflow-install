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

  sha     = "377ed65ec3f02d85204f7478423d83d59e3c90bfde741adff0c7fd58e93dc9f0"
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

  sha     = "h1:XJ0lRu+N4oajtlGdlEbGB/qW2mjI67Fqh+IQznI/LpE="
  retries = 0
}
