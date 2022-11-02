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
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "50b3580db0a7b0edf61e782270fb599c1f1a9ab9f502384d0c80957833df80c2"
    retries = 0
    verbose = false
  }
}
