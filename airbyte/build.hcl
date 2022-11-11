metadata {
  name = "airbyte"
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
  path = "helm/airbyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "ff5932f18e902462aa0420261f0194ecf7d6b48a51b8ab293378381d9e91990d"
    retries = 0
    verbose = false
  }
}
