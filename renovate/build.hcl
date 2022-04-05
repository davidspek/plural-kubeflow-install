metadata {
  name = "renovate"
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
  path = "helm/renovate"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "5c26bcf0c52fd0e435b90120ecf203e0d4e94a7d4a8851c9158b6a792a86f2de"
    retries = 0
  }
}
