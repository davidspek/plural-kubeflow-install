metadata {
  name = "loki"
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
  path = "helm/loki"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "f46fe517e77d2b3533f2bde9c4082674f7cb29e9b18b0e79934cdcaf9a68d1b8"
    retries = 0
    verbose = false
  }
}
