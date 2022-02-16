metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:NZUYSBECdkDb/jP/PXNtO/M4qWyyPP71+iiw0hWvP1o="
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

  sha     = "h1:NZUYSBECdkDb/jP/PXNtO/M4qWyyPP71+iiw0hWvP1o="
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

  sha     = "3cd2cab35f4faace4c48aa436119e2b986c4e971ae2d7e84e2adacc0a595b160"
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

  sha     = "h1:+Bc8XEIw2wL7ulRTXmoWyUwnnnVBcDxAXoyguy7tSiQ="
  retries = 0
}
