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

    sha     = "cf7cc3fb458c534f7b1789bf9ddec8629ad0da66553e6405d2e1fc6f8b54df5b"
    retries = 0
    verbose = false
  }
}
