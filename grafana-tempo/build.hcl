metadata {
  name = "grafana-tempo"
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
  path = "helm/grafana-tempo"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "b5361d6e7915749829f211e318ed4129f8aa45ef2e476fcd5875ff0eb9d564e7"
    retries = 0
    verbose = false
  }
}
