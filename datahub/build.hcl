metadata {
  name = "datahub"
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
  path = "helm/datahub"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "482dadbcdbe7208a0b3a267159663662f932428514dae129f0206c8561a68729"
    retries = 0
    verbose = false
  }
}
