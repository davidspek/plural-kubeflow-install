metadata {
  name = "nocodb"
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
  path = "helm/nocodb"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "a97e1cd07e84c623a1e3485df448cea2e4f1b4364d6c9950b5393f572b0105a0"
    retries = 0
    verbose = false
  }
}
