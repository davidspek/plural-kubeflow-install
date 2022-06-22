metadata {
  name = "minio"
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
  path = "helm/minio"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "1a1ed6990434caed526240ef4683cc177e2fbfdab7d1813f58e20e28fdbaa81b"
    retries = 0
    verbose = false
  }
}
