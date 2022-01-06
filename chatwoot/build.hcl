metadata {
  name = "chatwoot"
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
  path = "helm/chatwoot"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "f7d9bd9f6fba85ae47a1eee0d6373ce3d61dd215e1d4af1084ce0c0b811e3e4c"
    retries = 0
  }
}
