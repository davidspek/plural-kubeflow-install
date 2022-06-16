metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:MJJjubb7XABR1ys/o3A/lrqqvPv2kfbJZ3BPlY3m2fA="
  retries = 0
  verbose = false
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

  sha     = "h1:MJJjubb7XABR1ys/o3A/lrqqvPv2kfbJZ3BPlY3m2fA="
  retries = 0
  verbose = false
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

  sha     = "d156bfe663a17c5c94cb0245d5386b7681bbeeeff1e1fb843466632a99bf984c"
  retries = 0
  verbose = false
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

  sha     = "h1:XoSiMDBXS4B3yLUQ7P5nvoXER+a6SQBDIKVeh+ct1xc="
  retries = 0
  verbose = false
}
