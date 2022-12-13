metadata {
  name = "loki"
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
  path = "helm/loki"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "8b467f9d6303ec3094cd0ba45d27ce2df0f41d53a324e27ce70ed68948177953"
    retries = 0
    verbose = false
  }
}
