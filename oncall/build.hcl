metadata {
  name = "oncall"
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
  path = "helm/oncall"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "016397cc8ca931bc02f69a950dcb1aca735c08190c1fcb3bee9409780a031ef3"
    retries = 0
    verbose = false
  }
}
