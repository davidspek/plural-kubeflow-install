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
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "a737b459b24f087dbb4c1453b14e0b7fb8b444b51ea22117eb11271161cb471d"
    retries = 0
  }
}
