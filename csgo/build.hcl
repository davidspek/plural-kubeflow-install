metadata {
  name = "csgo"
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
  path = "helm/csgo"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "0ad83859e4eab5aeff23b1c474f3e056c6ae065ae0ec2d7933b1a8b71bfd41fa"
    retries = 0
    verbose = false
  }
}
