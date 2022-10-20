metadata {
  name = "loki"
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
  path = "helm/loki"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "cb250cda8cd1c5d3f3b1a042937e2aed3ef293244048612b103c2f299c5b41f3"
    retries = 0
    verbose = false
  }
}
