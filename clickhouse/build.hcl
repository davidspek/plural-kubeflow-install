metadata {
  name = "clickhouse"
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
  path = "helm/clickhouse"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "dcf235fc46ba4c9c7b78b23e3ba82c1bc8d12451d7c052476fbbaa30ed044162"
    retries = 0
    verbose = false
  }
}
