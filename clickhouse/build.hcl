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

    sha     = "1b08c8d79374f7e8aed82c09f27b63fc0d00c514e90bdd83ef953d171cfd093a"
    retries = 0
    verbose = false
  }
}
