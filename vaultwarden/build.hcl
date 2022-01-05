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

    sha     = "da726359490a23747bd89f0aa2d9509f1c24935608e048ffa9ae7f3dce68e1e3"
    retries = 0
  }
}
