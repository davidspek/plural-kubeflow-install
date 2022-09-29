metadata {
  name = "csgo"
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
  path = "helm/csgo"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "21c061b5c1618ee4db3bdf11982147cab31aa757adf60a0c91fb8c6a50752c41"
    retries = 0
    verbose = false
  }
}
