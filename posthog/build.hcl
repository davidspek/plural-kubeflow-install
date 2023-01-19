metadata {
  name = "posthog"
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
  path = "helm/posthog"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "6e544c97c81f70788ed8a504add690e1f79b3855642b093c19fb91d7cce813aa"
    retries = 0
    verbose = false
  }
}
