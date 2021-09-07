metadata {
  name = "minio"
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
  path = "helm/minio"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "60adcc2f96cc86d66b066a0ca3ff8bf043940e9c6d9b06384bfd24bef46b1333"
  }
}
