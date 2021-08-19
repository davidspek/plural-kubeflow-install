metadata {
  name = "sentry"
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
  path = "helm/sentry"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "aefdb23fc9215d3994833666ca0df77c5d0c1f3a938f6ac93b4c39a837b8882d"
  }
}
