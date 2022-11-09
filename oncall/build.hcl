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

    sha     = "5a3752d4cb9252cd12f8bfd976a00da9a3904aecb66b574fc222f0b810f894db"
    retries = 0
    verbose = false
  }
}
