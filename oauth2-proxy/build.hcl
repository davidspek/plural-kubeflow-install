metadata {
  name = "oauth2-proxy"
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
  path = "helm/oauth2-proxy"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "oauth2-proxy",
      "cm://app.plural.sh/cm/oauth2-proxy",
    ]

    sha = "eb92f0c3fca89267bfa05815f60d5f763833bd58bdd249afa1f2c0a256a302fe"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "eb92f0c3fca89267bfa05815f60d5f763833bd58bdd249afa1f2c0a256a302fe"
  }
}
