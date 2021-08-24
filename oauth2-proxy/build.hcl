metadata {
  name = "oauth2-proxy"
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
  path = "helm/oauth2-proxy"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "f9d8f8ffd184f188be09e2ebb62154b39b48ab4792a386da6663f2b3955f6d48"
  }
}
