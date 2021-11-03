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

    sha     = "c7aae78646aa1dcfd806003235adaaee5a07d286848148e2fad634344641c6f5"
    retries = 0
  }
}
