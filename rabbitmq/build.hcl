metadata {
  name = "rabbitmq"
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
  path = "helm/rabbitmq"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "f0737e61b2705e77d3fda547d2bf76c4dbfb328c6c02198fd755b68e1c830ade"
  }
}
