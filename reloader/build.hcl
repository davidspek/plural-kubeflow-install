metadata {
  name = "reloader"
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
  path = "helm/reloader"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "9b2744c657b9a8605d41b6d894afe6c50e5a2df1f4945dbaceb0bdc072d1ea95"
    retries = 0
    verbose = false
  }
}
