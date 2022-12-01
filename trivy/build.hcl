metadata {
  name = "trivy"
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
  path = "helm/trivy"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "7e04f6eba79430e09cd156d6c4f4cafc45534de7ba66792ccfd989f683a3c419"
    retries = 0
    verbose = false
  }
}
