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

    sha     = "3ea2abd44983de85af220bc7b68281d3751cf05d2227a74278e740b5ed0f7666"
    retries = 0
  }
}
