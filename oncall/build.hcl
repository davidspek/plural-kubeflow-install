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

    sha     = "518304858c391e04267357dd9e854f2102ef07b08b72ed93884db51c47eaada6"
    retries = 0
    verbose = false
  }
}
