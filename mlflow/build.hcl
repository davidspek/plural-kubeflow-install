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

    sha     = "e377f9b3678be45c4a609a5dbcfe69dc0c53387553bab69afd6df3b3406ec22c"
    retries = 0
  }
}
