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

    sha     = "049d1e87b683459f801eefeebbe24fcdab8be979cf6d182fb84b8d458559bbe3"
    retries = 0
    verbose = false
  }
}
