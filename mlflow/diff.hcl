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

  sha     = "a875f39cb6d1f990490e7611e092d44c2aabdcc8d12fc4e4e99851af0243ce90"
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

  sha     = "h1:P0hEYsQ1BCvegfz9c0ghvCZYLRM7JGKMi5rCdE4OHIQ="
  retries = 0
  verbose = false
}
