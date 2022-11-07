metadata {
  name = "external-secrets"
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
  path = "helm/external-secrets"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5859bda5341c2bc745e65f9a52d1be5dfc1394f30e81e938375f53005cb12d99"
    retries = 0
    verbose = false
  }
}
