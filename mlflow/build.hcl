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
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "7a37d52f22008089918e7a4483d22d8f0ec23fe89e2cea979c052b6b935feaa6"
    retries = 0
  }
}
