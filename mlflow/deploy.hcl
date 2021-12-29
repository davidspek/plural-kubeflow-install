metadata {
  path = "mlflow"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:lhSrpSK2hV9NKFRx/zfDHWs+AfgANQlgmp0UKiu3CyY="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:lhSrpSK2hV9NKFRx/zfDHWs+AfgANQlgmp0UKiu3CyY="
  retries = 1
}

step "terraform-output" {
  wkdir   = "mlflow"
  target  = "mlflow/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "3376c6c17777644bf123f40ddef68cd54abeea58ec5a1ffcb80efb7697ced89e"
  retries = 0
}

step "crds" {
  wkdir   = "mlflow"
  target  = "mlflow/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mlflow",
  ]

  sha     = "h1:VWu9qY0X5doaRHIqAV38mjG0hKInlNwo5YwT9XiUSvQ="
  retries = 0
}

step "bounce" {
  wkdir   = "mlflow"
  target  = "mlflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mlflow",
  ]

  sha     = "h1:/ypSN6nIqVZ8qxiJvXs+fXgq0CBM4t3gWp1Rt4u+Rrc="
  retries = 1
}
