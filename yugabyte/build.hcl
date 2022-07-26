metadata {
  name = "yugabyte"
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
  path = "helm/yugabyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5c208dcaa67f97f214a73f46dfdd9da6fb4f5231f453cbaaeb1fbe27854f77b7"
    retries = 0
    verbose = false
  }
}
