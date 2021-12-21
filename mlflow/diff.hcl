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

  sha     = "ee68073156cde1e24711a69c51577dbf9ff3e4646b01dfbd2e8f142036fec648"
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

  sha     = "h1:/0i9qkb0OqWnomNpjvz/FU0RypU7DUhhclV19hVppfg="
  retries = 0
}
