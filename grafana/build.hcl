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

    sha = "4b1fd5088c9c11e1db55230f3121a91f058b4e041c6032b08d3c5d9727f3aa70"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "4b1fd5088c9c11e1db55230f3121a91f058b4e041c6032b08d3c5d9727f3aa70"
  }
}
