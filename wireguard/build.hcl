metadata {
  name = "wireguard"
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
  path = "helm/wireguard"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "31a597275c1a8d18a887bde98592e0b095e312caed248f9268d77b8d019dfe50"
    retries = 0
    verbose = false
  }
}
