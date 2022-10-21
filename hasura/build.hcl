metadata {
  name = "hasura"
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
  path = "helm/hasura"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "c760153839e9020571f22871456cb3dfbc36c1a297782d1d33f269c6fc3c7344"
    retries = 0
    verbose = false
  }
}
