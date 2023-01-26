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

    sha     = "eb132cc75860d8e824332823562d3537d97bfca0d95aa66d6ed410929b4f52bc"
    retries = 0
    verbose = false
  }
}
