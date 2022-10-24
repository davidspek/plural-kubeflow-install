metadata {
  name = "superset"
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
  path = "helm/superset"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "54c3cca0664dc36cd528d7474b47bf7b8f5080ac939e97ee3b4e89820a20925e"
    retries = 0
    verbose = false
  }
}
