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

  sha     = "eab968b8593e85c181f81f3523bd62c1085170d2f3d1f27da5f2a2b63ad2949e"
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

  sha     = "h1:HD7WZRmyT/8bXd/Ciguc1d9JRUgUuLceDdPZ6rgIBHc="
  retries = 1
  verbose = false
}
