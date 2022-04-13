metadata {
  name = "redis"
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
  path = "helm/redis"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "5eedea2c852c36cb0b0d3d330c458e08fcff4c1fd5ced9c2f2c414d41aaf1795"
    retries = 0
  }
}
