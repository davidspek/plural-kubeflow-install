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

    sha = "775524d2669392c42f8b33618f1e9f3eca09bd323c460c83fa6bbb7b36d9340d"
  }
}
