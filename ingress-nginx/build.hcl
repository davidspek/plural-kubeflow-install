metadata {
  name = "ingress-nginx"
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
  path = "helm/ingress-nginx"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "de412f470a2c5ff4846c695ad8aadcbdcae6536d754bd9c2cb83c7335a455549"
    retries = 0
  }
}
