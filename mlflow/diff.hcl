metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
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

  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
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

  sha     = "598bb06d6de243ebf03ef89833f5585c2c68821775be0f7c2709a09cfa3adb35"
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

  sha     = "h1:gKV9fhxs2v0rrLCoGTcAQAJSHVwSu+lPOCpqBM9c3Dc="
  retries = 0
  verbose = false
}
