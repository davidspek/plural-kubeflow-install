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

    sha = "265b8115c5549e0ae9b8c7309dcb61da4a031c6c19ce974d8fda46fd690da824"
  }
}
