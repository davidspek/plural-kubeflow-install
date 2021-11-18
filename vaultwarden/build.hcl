metadata {
  name = "vaultwarden"
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
  path = "helm/vaultwarden"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "c7bcc183c0d93da010144ec25af0aa727f534bf3fe60c8c413c06339214558dc"
    retries = 0
  }
}
