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

    sha     = "28c71095cb82065c62b3251e721a9b0c9cda43afa5c54dd4736cc98c94adbf70"
    retries = 0
  }
}
