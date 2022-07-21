metadata {
  name = "trino"
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
  path = "helm/trino"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "c32228dba7cc1d83520b1f3f89de2ff67f598e78a4fe0ed7c9b282a8616258d4"
    retries = 0
    verbose = false
  }
}
