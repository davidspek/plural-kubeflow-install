metadata {
  name = "kubricks"
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
  path = "helm/kubricks"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "8bacec53949ce8a924e9e13513691b01ab13a1fc2f86d7e58206b6d1ba8ad094"
    retries = 0
    verbose = false
  }
}
