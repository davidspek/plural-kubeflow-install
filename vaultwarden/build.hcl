metadata {
  name = "vaultwarden"
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
  path = "helm/vaultwarden"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "977ddab9b87eed1228048bf30c6b042eefdb064636212bcbcaa1e08aafc692e8"
    retries = 0
  }
}
