metadata {
  name = "kyverno"
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
  path = "helm/kyverno"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "cc6aa3ccb2c389ad93f4653e8b207ee3f82838f2b095aeabe9026a5bcb19d0b3"
    retries = 0
  }
}
