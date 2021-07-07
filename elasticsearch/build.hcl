metadata {
  name = "elasticsearch"
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
  path = "helm/elasticsearch"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "elasticsearch",
      "cm://app.plural.sh/cm/elasticsearch",
    ]

    sha = "cbd2280ac5cad9489b79b8340bcf5156dabe1ce174d27230ae7746d9ca1e67e3"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "cbd2280ac5cad9489b79b8340bcf5156dabe1ce174d27230ae7746d9ca1e67e3"
  }
}
