metadata {
  name = "prefect"
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
  path = "helm/prefect"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "c9afc90056cdcebd368dc17edf2ffd601dade8bfc912ed7ff3bcc338c558e834"
    retries = 0
    verbose = false
  }
}
