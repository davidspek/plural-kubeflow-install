metadata {
  name = "n8n"
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
  path = "helm/n8n"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "f0d3e790c6e3c56f60cbeea9784bd1ae6617ab69484aca9f43ec5bf21747a31f"
    retries = 0
    verbose = false
  }
}
