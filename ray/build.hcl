metadata {
  name = "ray"
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
  path = "helm/ray"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "dfd4335fa2e1a35c0b2f3a66909e8c4f468bb885d407c75f5b77e3a2bbcc6af2"
    retries = 0
    verbose = false
  }
}
