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

  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "mlflow/terraform"
  target  = "mlflow/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:j0e6x/IcqNv0dGMlPMVckrdw6vXBYgNhdPNLZvR0oU4="
  retries = 1
  verbose = false
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
  ]

  sha     = "c0c4399d80b200308413c122628fe3985017fbd146ecf1787c0ab2675c3ed0b9"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:IUnkct34f3dCYWDWfltAePuqDHumfHTVnFImO8fZ5NU="
  retries = 1
  verbose = false
}
