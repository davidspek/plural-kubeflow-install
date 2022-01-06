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

    sha     = "0de6dab71cfcb6d7a82d816c04fe8142af06b81d1869f34c636606f6812076a8"
    retries = 0
  }
}
