metadata {
  name = "jitsu"
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
  path = "helm/jitsu"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "c4fa37aaf6d96738048e3a7933805a75a0786bfc4d0b2359eca40621afb16f0a"
    retries = 0
    verbose = false
  }
}
