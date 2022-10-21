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

    sha     = "2e2227469ba37e8b9901fe29962e83e08e8e54f518e52cb1de1ea18e43a8a1b4"
    retries = 0
    verbose = false
  }
}
