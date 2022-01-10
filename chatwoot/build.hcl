metadata {
  name = "chatwoot"
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
  path = "helm/chatwoot"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "d50140646a305f383af225dc3aab54fa8750d4caf1e10c6686a1977c56130a70"
    retries = 0
  }
}
