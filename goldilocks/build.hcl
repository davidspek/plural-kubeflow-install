metadata {
  name = "goldilocks"
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
  path = "helm/goldilocks"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "dd34703eac052435a60a6f727e1c13b12f5c15ba7aa846f080075812efecdfe5"
    retries = 0
  }
}
