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

    sha     = "4520b5dbbed21df0c89a6a4f4bd14c0a858976ecb40496cc7450cc752577d3ee"
    retries = 0
    verbose = false
  }
}
