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

    sha     = "5873ed33635ae317a0fb327a1313dfab90a9b2ab6b97cb2d9bcecd556b874915"
    retries = 0
    verbose = false
  }
}
