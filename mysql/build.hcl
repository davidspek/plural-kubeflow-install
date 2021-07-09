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

    sha = "1fb257f097667fbb1129c9cb509498985548419acb40c6356911b783de4a01b8"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "1fb257f097667fbb1129c9cb509498985548419acb40c6356911b783de4a01b8"
  }
}
