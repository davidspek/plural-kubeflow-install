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

  sha     = "8ad7981f745c68ed14a92e3b5933f52fa492a7b41a31f77439dc7f71bbf420da"
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

  sha     = "h1:XaZ2hXjirW4LiXUDOxrpeS+91bRhGOrIDEaulrhNdNU="
  retries = 1
}
