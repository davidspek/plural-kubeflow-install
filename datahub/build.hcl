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

    sha     = "d0c45137a3d56f88eaafc2ccca763f3145a7664b5df7f4d5e764bedfa1eec399"
    retries = 0
    verbose = false
  }
}
