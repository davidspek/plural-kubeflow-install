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

    sha     = "b32f9f512d46b1aba8e34ba5e0b1a5d28090972158ea7d412a9919179603b6aa"
    retries = 0
    verbose = false
  }
}
