metadata {
  name = "metabase"
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
  path = "helm/metabase"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "aa4d9614abc68a07b598a9206ae99c8ce7754a29158e4162624a0c118393cbad"
    retries = 0
    verbose = false
  }
}
