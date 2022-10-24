metadata {
  name = "superset"
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
  path = "helm/superset"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "f8ba35b1a7884d305e009f4fbca08aed7ae6992581915cfae96aaa0d40a9dd49"
    retries = 0
    verbose = false
  }
}
