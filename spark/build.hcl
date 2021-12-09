metadata {
  name = "spark"
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
  path = "helm/spark"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "4548f0e99cdfcae0fcaa37c359013459ff2b416b722c1b5d0725a9633646da86"
    retries = 0
  }
}
