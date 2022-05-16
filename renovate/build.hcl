metadata {
  name = "renovate"
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
  path = "helm/renovate"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "7584b8736b7f45af561b5cfe089538ebd451fb04aebe6b331e7811bce8cd1301"
    retries = 0
    verbose = false
  }
}
