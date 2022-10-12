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

    sha     = "a865ef103a61e592916454933edcf7cc75cd8377c7ae9fc01affea911ad1e008"
    retries = 0
    verbose = false
  }
}
