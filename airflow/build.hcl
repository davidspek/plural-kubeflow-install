metadata {
  name = "airflow"
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
  path = "helm/airflow"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5a718d3ec8e645c3f997bc9d2cb1b86dd14ab461f041ce1a6d4886b735413057"
    retries = 0
    verbose = false
  }
}
