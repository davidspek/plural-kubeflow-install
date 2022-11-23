metadata {
  name = "dagster"
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
  path = "helm/dagster"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "af9fa4bab141bcd436a7997bc71d066c3a19f4907ad80ae36b357e24989f5ba6"
    retries = 0
    verbose = false
  }
}
