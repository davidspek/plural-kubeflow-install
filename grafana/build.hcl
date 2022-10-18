metadata {
  name = "grafana"
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
  path = "helm/grafana"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "9ece8ef41e05dfafa144b2e738d3735742ab7cb380152465d694ff6cec1002ac"
    retries = 0
    verbose = false
  }
}
