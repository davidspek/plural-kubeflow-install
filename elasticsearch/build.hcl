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

    sha     = "e3df2861d661cf79161ef4479d56863e557f9b8a92e5eab4044e632efdc55f39"
    retries = 0
    verbose = false
  }
}
