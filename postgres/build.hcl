metadata {
  name = "postgres"
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
  path = "helm/postgres"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5dc55ac26a9e4d9ef5a4b5c21cc62f5f1e5072a63ec4d707621e117b492acd0a"
    retries = 0
    verbose = false
  }
}
