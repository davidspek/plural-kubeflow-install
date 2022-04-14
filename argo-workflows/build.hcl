metadata {
  name = "argo-workflows"
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
  path = "helm/argo-workflows"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "d8523151d802de6f5156a176e575fc537a2a6f43ded797933eba0f71bf3ab2de"
    retries = 0
  }
}
