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

    sha = "abdf7853f6386d556a32a72e1b8f88e7d47c4c1948a8f5e55cfe2566305b3196"
  }
}
