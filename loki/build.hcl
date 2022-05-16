metadata {
  name = "loki"
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
  path = "helm/loki"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "e6d26d7d8f82b51f5f9cbc061eb7e42803d37d0793a9f0f4914c13bcf18a17b1"
    retries = 0
    verbose = false
  }
}
