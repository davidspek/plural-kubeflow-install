metadata {
  name = "strapi"
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
  path = "helm/strapi"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "280b5f4befd7722d2f324f9cddd7190717ab053783df8d26efa10389f039c583"
    retries = 0
    verbose = false
  }
}
