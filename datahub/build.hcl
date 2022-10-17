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

    sha     = "17b708614f4ab8bdf9da927f1411576564b9391c02b253cc8d9941f3f3214535"
    retries = 0
    verbose = false
  }
}
