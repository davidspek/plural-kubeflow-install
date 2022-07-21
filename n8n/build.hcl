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

    sha     = "d50ffa39daa5970abd621af35a3a67c964f99624eb3a7bda3b0d0501f97afd38"
    retries = 0
    verbose = false
  }
}
