metadata {
  name = "jitsu"
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
  path = "helm/jitsu"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "de0f50d97b0d1a2cadcd82bc1e613a1a3e6f3b7476eebcb91d6b7656275d99e8"
    retries = 0
    verbose = false
  }
}
