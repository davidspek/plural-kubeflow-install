metadata {
  name = "console"
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
  path = "helm/console"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "79a36b77af762a8e5e99a0ee97d19ab4d1c807aec8e4ae2abe0e8aaa18d182c1"
    retries = 0
    verbose = false
  }
}
