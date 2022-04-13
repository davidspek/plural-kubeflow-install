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

    sha     = "37cd65ecf134c826b453b74121f9b1a61a2d9e34eb8a06f37278424529c1632e"
    retries = 0
  }
}
