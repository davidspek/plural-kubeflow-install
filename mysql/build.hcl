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

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "mysql",
      "cm://app.plural.sh/cm/mysql",
    ]

    sha = "2c75bc4c8916288afd9b2cfed138255d4f367d2895eeb6dbf0f734890e29c26d"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "2c75bc4c8916288afd9b2cfed138255d4f367d2895eeb6dbf0f734890e29c26d"
  }
}
