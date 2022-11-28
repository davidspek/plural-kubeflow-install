metadata {
  name = "prefect"
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
  path = "helm/prefect"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "fb134eaa2bdcacd9a00ce81907c3c03f18ece47d4a12fb7ed6009acb5412f29b"
    retries = 0
    verbose = false
  }
}
