metadata {
  name = "goldilocks"
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
  path = "helm/goldilocks"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "25ff1a70bf4c63007df39d047830830e8a2440b01830c4cc711b40ff07d2fc62"
    retries = 0
  }
}
