metadata {
  name = "lightdash"
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
  path = "helm/lightdash"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "88a683518b52348b7a8ddd93cdc2b0eb5c45dc1b9bb94a302d29ddeeac0f7102"
    retries = 0
    verbose = false
  }
}
