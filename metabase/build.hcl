metadata {
  name = "metabase"
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
  path = "helm/metabase"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "4d010a74779e33ee605ce4ba3285ae332020da183a48e05e2a67f3f6000d95b8"
    retries = 0
    verbose = false
  }
}
