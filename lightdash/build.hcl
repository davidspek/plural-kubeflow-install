metadata {
  name = "lightdash"
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
  path = "helm/lightdash"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "9c0b738157be0faba6ba91ce615c4cb29a35afb3b59cf98f8b1a37c48489b731"
    retries = 0
    verbose = false
  }
}
