metadata {
  name = "crossplane"
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
  path = "helm/crossplane"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "58231f36851d52e76d434be7e8bdfe5ab4b6c81ada19c1ba66547e3f33147ba3"
    retries = 0
  }
}
