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

    sha     = "3dd830cf2a749eb1029f140935f7c87f449748ab9b83c087458f4dff84d6f5d5"
    retries = 0
    verbose = false
  }
}
