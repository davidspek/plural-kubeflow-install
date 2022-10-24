metadata {
  name = "nocodb"
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
  path = "helm/nocodb"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "a3ca8b14fcc729af501e47d9637aaf74373bd46ed8836f04dd62077681c6ebf8"
    retries = 0
    verbose = false
  }
}
