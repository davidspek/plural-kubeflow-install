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
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "58c695184ac5cbaf4f3f7cabf1eb0c586017c8201e235039c0a93cf577a641db"
    retries = 0
    verbose = false
  }
}
