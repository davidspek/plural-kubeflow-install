metadata {
  name = "dex"
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
  path = "helm/dex"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "dex",
      "cm://app.plural.sh/cm/dex",
    ]

    sha = "0fa9725efc7ff2d89cffeb25b313afcc28481cdfe48c9d61897fd7ca8de02899"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "0fa9725efc7ff2d89cffeb25b313afcc28481cdfe48c9d61897fd7ca8de02899"
  }
}
