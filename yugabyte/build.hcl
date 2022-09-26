metadata {
  name = "yugabyte"
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
  path = "helm/yugabyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "757516cc310498123adeab565a47f223b781af9e94c28de40fbb50bec2b8a699"
    retries = 0
    verbose = false
  }
}
