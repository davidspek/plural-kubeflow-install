metadata {
  name = "nextcloud"
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
  path = "helm/nextcloud"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "d9e7b27d9e7804e1945f2e1ba7f5befb405f0e3d5e3dd02c7727897741a3b64d"
  }
}
