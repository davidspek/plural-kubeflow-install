metadata {
  name = "mlflow"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/mlflow"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "cd65fb0329d4cfe75b4b33a23bec0c64c29246d76c0bb8215d9947eabde74b65"
    retries = 0
    verbose = false
  }
}
