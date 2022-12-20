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

    sha     = "ddfcd48337bcac03b81e63ddf545c458c09465ad972b0390c818de9375664de4"
    retries = 0
    verbose = false
  }
}
