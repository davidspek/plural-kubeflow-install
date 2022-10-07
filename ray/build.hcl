metadata {
  name = "ray"
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
  path = "helm/ray"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5f9c85117b25a796ce8d5d913f7b0ecc1945059a17eb9c3598acf31f89ac5e94"
    retries = 0
    verbose = false
  }
}
