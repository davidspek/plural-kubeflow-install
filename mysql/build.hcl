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

    sha = "080d94bee71990ade4a8defc7aa09cb971cd6582ef2c09b328165acfe3723e7c"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "080d94bee71990ade4a8defc7aa09cb971cd6582ef2c09b328165acfe3723e7c"
  }
}
