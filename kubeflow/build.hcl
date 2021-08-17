metadata {
  name = "kubeflow"
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
  path = "helm/kubeflow"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "a1ea816dbd77dbd1cbd6a134d73a0bfba1e9b13a9aed6feac8cfd4f1f1b7255a"
  }
}
