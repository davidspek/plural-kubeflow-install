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

    sha     = "d358b7ab955a442f091795d8a3d9b5a0c9e5b29896dd790567f9560b4e6f708e"
    retries = 0
  }
}
