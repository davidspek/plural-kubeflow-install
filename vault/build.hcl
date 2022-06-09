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

    sha     = "178de6a2774e1c750981d8e58c60ed2060d761e4f8ec012f4b5ccee126eca6fe"
    retries = 0
    verbose = false
  }
}
