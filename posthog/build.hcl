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

    sha     = "141c6a70baae27fc10fc5c6489959f8eea86660c94667f289e52ffe66752f596"
    retries = 0
    verbose = false
  }
}
