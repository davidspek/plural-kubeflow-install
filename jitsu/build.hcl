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

    sha     = "86e6a2bef9a54bbc93dc5317d0a2a270fd58e91b32c5f2e0f9b71559304260c3"
    retries = 0
    verbose = false
  }
}
