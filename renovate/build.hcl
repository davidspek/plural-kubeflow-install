metadata {
  name = "renovate"
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
  path = "helm/renovate"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "86232b1e6992b61c2514ade96c596df894ad2a963b54df894f81bdddbfb091d7"
    retries = 0
  }
}
