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

    sha = "151dcd39ed54c057df032c1da2ac2c19d0b16a2f6977dd393d1fb8b37fa1e472"
  }
}
