metadata {
  name = "yugabyte"
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
  path = "helm/yugabyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "7b1af42fba3cfaab45d19ff43b4212f92e68e99dedecfb3abb69e438e79e06d5"
    retries = 0
    verbose = false
  }
}
