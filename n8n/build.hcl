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

    sha     = "364b43f3cbb100d541c05bf0106c9749aeea82401e6cd1f78eac9dcfb5973165"
    retries = 0
    verbose = false
  }
}
