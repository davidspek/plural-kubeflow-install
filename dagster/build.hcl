metadata {
  name = "dagster"
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
  path = "helm/dagster"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "0ea314b09be669352cb4072c0c0a530ab0054ebceae6624464145ab95747d229"
    retries = 0
    verbose = false
  }
}
