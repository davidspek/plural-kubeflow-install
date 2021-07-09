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

    sha = "e165d2cb68e5b898a8d444dcfff0073525817a38f05a563d1225f109fc9b4950"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "e165d2cb68e5b898a8d444dcfff0073525817a38f05a563d1225f109fc9b4950"
  }
}
