metadata {
  name = "n8n"
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
  path = "helm/n8n"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "7c5170f07527d1e7c0a637b902b07875d0b81e7f7fad1e5eee62c573e7ae9aae"
    retries = 0
    verbose = false
  }
}
