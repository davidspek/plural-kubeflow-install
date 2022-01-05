metadata {
  name = "nvidia-operator"
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
  path = "helm/nvidia-operator"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "f7d82233a579f98b1aac26ea1e919739cc5aad82423daceb5b2daeada2310960"
    retries = 0
  }
}
