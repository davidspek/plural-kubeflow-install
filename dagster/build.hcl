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

    sha     = "11d992441acc8d217c7d37d37b8a7a4d761b3b69d879b07ed21a55515704445e"
    retries = 0
    verbose = false
  }
}
