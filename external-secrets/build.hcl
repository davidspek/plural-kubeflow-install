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

    sha     = "74790a7472a56aa7aed11da0a9a21467b112470608c1dac04920165f4d53fb47"
    retries = 0
    verbose = false
  }
}
