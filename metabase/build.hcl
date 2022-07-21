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
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "8d4d60bfd885f9835bbd544db5f844da12fbdfa9919f270a0732e63b23d6e2aa"
    retries = 0
    verbose = false
  }
}
