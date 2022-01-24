metadata {
  name = "chatwoot"
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
  path = "helm/chatwoot"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "b2a62a8ecaa7b7bc71eafeb5260a6ec28614ac8bffb7bd2893e7538f5c8e7760"
    retries = 0
  }
}
