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

    sha     = "92f351bb638fed41f07c4d7a6a91aa23c276bc74688e12fa67d7ea7d0e0e271f"
    retries = 0
  }
}
