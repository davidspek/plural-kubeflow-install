metadata {
  name = "knative"
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
  path = "helm/knative"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "fcc07cdd2c802d4a967834e7c076ffcb70def8e4b9ba25b3761328ccbc1dc83d"
    retries = 0
  }
}
