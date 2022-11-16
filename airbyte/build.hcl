metadata {
  name = "airbyte"
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
  path = "helm/airbyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "0dc0d6e8c8be963508ab4a0685d84f9425cc025142a76d5db42796761e76abde"
    retries = 0
    verbose = false
  }
}
