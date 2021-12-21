metadata {
  path = "mlflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:lhSrpSK2hV9NKFRx/zfDHWs+AfgANQlgmp0UKiu3CyY="
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

  sha     = "h1:lhSrpSK2hV9NKFRx/zfDHWs+AfgANQlgmp0UKiu3CyY="
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

  sha     = "4af86d6dc108bdc350dff5d03715939015e4d15a0954fd697dc3150a86f6a71b"
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

  sha     = "h1:JqSnMMLoJ8gOnzuMCt0kazh148HW/whTKZmpcEd583I="
  retries = 0
}
