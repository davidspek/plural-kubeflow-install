metadata {
  name = "datahub"
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
  path = "helm/datahub"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "1d0c5e879c8c7ffdaa5a8a73c8bdd0d34e6bd8a5c696deed4eedd3e539032aa9"
    retries = 0
    verbose = false
  }
}
