metadata {
  name = "kubricks"
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
  path = "helm/kubricks"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "99d7dc57501cd18352bdc1a349a92e44b9112cad8fa6918f4173c1745b1461b1"
    retries = 0
    verbose = false
  }
}
