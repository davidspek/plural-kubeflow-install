metadata {
  name = "postgres"
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
  path = "helm/postgres"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "postgres",
      "cm://app.plural.sh/cm/postgres",
    ]

    sha = "a225d82c2ac65e2e776b057aa1496d889218d79c3d13482fedc506c8fa78fa65"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "a225d82c2ac65e2e776b057aa1496d889218d79c3d13482fedc506c8fa78fa65"
  }
}
