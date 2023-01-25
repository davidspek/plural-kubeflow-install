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

    sha     = "cc76c3466c51d11a9269db17917da10814839d6bb38429fd141b40ef7bd560fe"
    retries = 0
    verbose = false
  }
}
