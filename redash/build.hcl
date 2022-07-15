metadata {
  name = "redash"
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
  path = "helm/redash"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "d08d43a8211d5f3a5bbe16f4b18a5c00d59589abeae2760eb2539a1f41fbe9f1"
    retries = 0
    verbose = false
  }
}
