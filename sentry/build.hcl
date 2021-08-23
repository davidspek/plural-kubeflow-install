metadata {
  name = "sentry"
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
  path = "helm/sentry"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "2c5389c8726b3823a7a081935813662b4c1a0f8179bb4c114e98ba2daf5e4173"
  }
}
