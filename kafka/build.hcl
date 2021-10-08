metadata {
  name = "kafka"
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
  path = "helm/kafka"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "137d83e342dbe6c0687617b2bb04afa506cabefc1424e9af21c920170c9eaf88"
    retries = 0
  }
}
