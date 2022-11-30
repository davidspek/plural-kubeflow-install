metadata {
  name = "sentry"
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
  path = "helm/sentry"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "2ce047924efc6d0feb0b0abd862a1c5565609fda3199a2b6ed0f92e7d3015fc8"
    retries = 0
    verbose = false
  }
}
