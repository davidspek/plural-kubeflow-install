metadata {
  name = "dagster"
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
  path = "helm/dagster"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "93b8656970dca617192b7a511e3f613facaf0b4f43ece8a2cf7b79ec7a7846b1"
    retries = 0
    verbose = false
  }
}
