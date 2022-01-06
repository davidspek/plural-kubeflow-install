metadata {
  name = "postgres"
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
  path = "helm/postgres"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "b52a60aaf4377fc784be8f8649581404d61e3d83251b53e88be87436150f0f6c"
    retries = 0
  }
}
