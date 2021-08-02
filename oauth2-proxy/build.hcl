metadata {
  name = "oauth2-proxy"
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
  path = "helm/oauth2-proxy"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "4d98988fffd0270d1d08b39a2c56b61f9741e78fcdc5dbb88c550b8259330edc"
  }
}
