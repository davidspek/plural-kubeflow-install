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

    sha     = "cd4a5ab4a94c64d892974d77ca25ced3991d5ffb21f5c19a299fe445cb8820f9"
    retries = 0
  }
}
