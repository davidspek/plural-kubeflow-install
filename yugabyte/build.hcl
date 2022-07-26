metadata {
  name = "yugabyte"
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
  path = "helm/yugabyte"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "81e52f0bb05ab54b4de6ccd8d4fc73eb957bbf8f1d0116f7a934fb262d0d19d7"
    retries = 0
    verbose = false
  }
}
