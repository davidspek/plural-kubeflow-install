metadata {
  name = "mysql"
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
  path = "helm/mysql"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "d66558d1b2dcb57f50ebfa190e0202438552a51c739fb5198e8c428952d37e2d"
    retries = 0
  }
}
