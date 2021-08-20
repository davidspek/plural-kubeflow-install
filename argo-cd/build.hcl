metadata {
  name = "argo-cd"
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
  path = "helm/argo-cd"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "a17d5e2a1425656d1bb2233927a1f664cf7e869f2d7879ca4049592dd171d02e"
  }
}
