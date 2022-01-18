metadata {
  name = "monitoring"
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
  path = "helm/monitoring"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "fc50c96289ae45035ec9f60f138502bc3198e9c8dfa937d2aa2e477773e0ac8a"
    retries = 0
  }
}
