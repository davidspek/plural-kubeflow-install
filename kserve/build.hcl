metadata {
  name = "kserve"
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
  path = "helm/kserve"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "b9c7940c06538ca3dd7410fd776ce32f176c032bfad8539feb26459cb77a3767"
    retries = 0
    verbose = false
  }
}
