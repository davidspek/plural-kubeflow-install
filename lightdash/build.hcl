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

    sha     = "b682f77141416104515aa287e067f751427c6f8ee337d97073cee1382622ae5b"
    retries = 0
    verbose = false
  }
}
