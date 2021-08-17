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

    sha = "3806fc39e3b14c011e1e96716d6affc9e75d9188fb016056a18419e0d950db1d"
  }
}
