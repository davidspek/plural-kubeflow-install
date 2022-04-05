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

    sha     = "4f6ce74ac0016f18bbe58ecfa1c2de8d47b22aa860380abe9d0d452efbea77f1"
    retries = 0
  }
}
