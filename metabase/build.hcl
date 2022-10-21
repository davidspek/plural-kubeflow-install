metadata {
  name = "metabase"
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
  path = "helm/metabase"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "65b246e9046338d78749eba5fbb39f54861e1b1ef3ba1c30714abe5f4b50c036"
    retries = 0
    verbose = false
  }
}
