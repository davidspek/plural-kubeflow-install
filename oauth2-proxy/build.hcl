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

    sha = "88d40df50d4eae09c090a3dbac5abe50c1b2ed8fe30cf158680bf14cca017061"
  }
}
