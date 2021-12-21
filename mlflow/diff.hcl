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

  sha     = "9016893f529e8726ab914e5d5e11fa910ba3e5027d173de5945894cc087c932c"
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

  sha     = "h1:oBEkL3lAT93lvD4+HzL2AlpCRQIFwfVfVEah1QQ2W1A="
  retries = 0
}
