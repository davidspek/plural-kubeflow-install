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

    sha     = "7e7c4af3b04879ddb18031a26f3ac6d6caa874674edaf46c6e3e6d8b1811ca7e"
    retries = 0
  }
}
