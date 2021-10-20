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

    sha     = "a4768b3689bdb3f2f269b9c8b943ba4eb417f3b91beed70f83bc02e465f0d7ff"
    retries = 0
  }
}
