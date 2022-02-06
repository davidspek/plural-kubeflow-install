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

    sha     = "41d7a3aa9adae448e3fdb51792a5eb33cd71df8b34e635b92dfeeb80d4d039d2"
    retries = 0
  }
}
