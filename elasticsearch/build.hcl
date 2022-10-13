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

    sha     = "bc7defe161ef33a4e14162b066dc6902c0228f9cad6b025c1879edf9570cb946"
    retries = 0
    verbose = false
  }
}
