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

  sha     = "h1:NZUYSBECdkDb/jP/PXNtO/M4qWyyPP71+iiw0hWvP1o="
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

  sha     = "h1:NZUYSBECdkDb/jP/PXNtO/M4qWyyPP71+iiw0hWvP1o="
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
  ]

<<<<<<< HEAD
  sha     = "3cd2cab35f4faace4c48aa436119e2b986c4e971ae2d7e84e2adacc0a595b160"
=======
  sha     = "c17aa1939edd5b0df9196afa7d1da03f3fddcb136588539acdf0e8a7bb5e3ab3"
>>>>>>> 39f8552c (redeploy all)
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

  sha     = "h1:+Bc8XEIw2wL7ulRTXmoWyUwnnnVBcDxAXoyguy7tSiQ="
  retries = 1
}
