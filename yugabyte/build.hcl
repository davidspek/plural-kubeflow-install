metadata {
  name = "yugabyte"
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
  path = "helm/yugabyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "142e8a4cf52cd0aaa170a2628cad06c051b48e6c3d2ce500cb82b469f6bdfdbe"
    retries = 0
    verbose = false
  }
}
