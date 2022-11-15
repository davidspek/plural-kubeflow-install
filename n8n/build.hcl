metadata {
  name = "n8n"
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
  path = "helm/n8n"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "85f2bf3f8e4ad8fdc5cc0420215457eb1ad3abac56dd670a362537afb9da624d"
    retries = 0
    verbose = false
  }
}
