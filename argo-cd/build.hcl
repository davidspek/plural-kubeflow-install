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
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "14ee0523ceb43ff8abd8ac36ec7af80bcf5a25cc6c77f0b9f68e3de35b4bc251"
    retries = 0
    verbose = false
  }
}
