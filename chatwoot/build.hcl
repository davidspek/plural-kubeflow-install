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

    sha     = "b70e7d541a71da3421c5b8503bee20112c8d7bf4610812ac5c4510e77d032160"
    retries = 0
  }
}
