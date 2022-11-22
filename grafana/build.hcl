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

    sha     = "5bb55366f0c8ac5f32a577ef2ae868135b4920a59dc5e5b9916aced6d7c38ab4"
    retries = 0
    verbose = false
  }
}
