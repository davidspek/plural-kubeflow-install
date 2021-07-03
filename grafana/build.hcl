metadata {
  name = "grafana"
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
  path = "helm/grafana"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "grafana",
      "cm://app.plural.sh/cm/grafana",
    ]

    sha = "71a07ff35b93ac601cf482b7a9ce557249b886ccc37febfe1b255f787bc42e6d"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "71a07ff35b93ac601cf482b7a9ce557249b886ccc37febfe1b255f787bc42e6d"
  }
}
