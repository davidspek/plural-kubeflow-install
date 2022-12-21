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

    sha     = "a39c424c75bc179f236037e52bb260fde6a6376120006be38e51be324dda44c8"
    retries = 0
    verbose = false
  }
}
