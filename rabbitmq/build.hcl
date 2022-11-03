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

    sha     = "0db54ef6ee0d72d5b8f29e640f2ac3c4b82ea07a641806eab21d97c07b415cfd"
    retries = 0
    verbose = false
  }
}
