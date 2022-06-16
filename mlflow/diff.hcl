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

  sha     = "2d87e538f2902926afa9be67aeb930445b265c3cecc874e6126bafb15f3867fa"
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

  sha     = "h1:SBRRkjt/+r2elR6e5HiWFzkNpQU2DWKpRTfS0xUuQjg="
  retries = 0
  verbose = false
}
