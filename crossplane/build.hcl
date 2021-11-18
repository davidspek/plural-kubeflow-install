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

    sha     = "c3d7934b0f5bb9bdb373eb87daab75407f7cae29848cc5ee2c8f5e8d4e84fd24"
    retries = 0
  }
}
