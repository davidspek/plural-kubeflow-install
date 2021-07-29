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

    sha = "43147ce5558b4f8a584530a99549be188925eb2f74b0bb748d174721e2bbd2f2"
  }
}
