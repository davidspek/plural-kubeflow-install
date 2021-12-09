metadata {
  name = "ingress-nginx"
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
  path = "helm/ingress-nginx"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "526cabfb5b4a466b764a8dc1f7d19837805f49b0711fdbc7ff4d5c3845eba392"
    retries = 0
  }
}
