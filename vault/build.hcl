metadata {
  name = "vault"
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
  path = "helm/vault"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "117a87a07d0c20b4945064ee4ee660c998affd2992c6fd9fdba7d5cc71bb9f05"
    retries = 0
    verbose = false
  }
}
