metadata {
  name = "jitsu"
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
  path = "helm/jitsu"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "4904ab8b418e1b2886e96c0725be2027c24ed871a7b1cd9387759dded798f958"
    retries = 0
    verbose = false
  }
}
