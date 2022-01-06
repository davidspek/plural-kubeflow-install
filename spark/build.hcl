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

    sha     = "660bfccbb256f562b98e38bd9353fbf3793f8cbda4ce50a92705341dae4cedd2"
    retries = 0
  }
}
