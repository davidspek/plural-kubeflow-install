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

    sha     = "3b260af0d1f9a324b2b5440a39d613e70f40646fe58a725bb8912ca95e482761"
    retries = 0
    verbose = false
  }
}
