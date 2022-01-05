metadata {
  name = "mysql"
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
  path = "helm/mysql"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "e8518fc17f38706aeacfa53d59e4d846476672ebebf69a0db5f20cc672009ef4"
    retries = 0
  }
}
