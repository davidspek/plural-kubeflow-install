metadata {
  name = "crossplane"
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
  path = "helm/crossplane"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "b24685ea9db525e24515cf12d6aa82b97ca1cd39e6a4c46463c922dfb06ce4ca"
    retries = 0
  }
}
