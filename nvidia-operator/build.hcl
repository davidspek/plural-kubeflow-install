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

    sha     = "c298679b1648acc17f0c6a51594344b59fc0f8db6e5de3f9adddd9a0d5be3da6"
    retries = 0
  }
}
