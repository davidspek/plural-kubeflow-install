metadata {
  name = "spark"
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
  path = "helm/spark"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "b5cc22c711280670d0960b6c96dfa67ce35a13750355cd1cc9b7f51f1683aaab"
    retries = 0
  }
}
