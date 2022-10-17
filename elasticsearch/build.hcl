metadata {
  name = "elasticsearch"
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
  path = "helm/elasticsearch"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "854d0043a67b84c8e0b84c7bd40696f1f4e13b362d1e287394487e3653f41615"
    retries = 0
    verbose = false
  }
}
