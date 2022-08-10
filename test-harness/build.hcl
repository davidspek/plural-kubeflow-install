metadata {
  name = "test-harness"
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
  path = "helm/test-harness"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "064818c9c9ad2a814fded288623fc9a46edce2c81551838166d04170ba0b322b"
    retries = 0
    verbose = false
  }
}
