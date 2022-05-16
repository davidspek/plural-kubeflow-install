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

    sha     = "7b68b4070cafc30a1b1f5d4deb377daf9c4483cf0e90a3a02b2937ce6dd62954"
    retries = 0
    verbose = false
  }
}
