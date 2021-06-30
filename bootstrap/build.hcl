metadata {
  name = "bootstrap"
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
  path = "helm/bootstrap"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "bootstrap",
      "cm://app.plural.sh/cm/bootstrap",
    ]

    sha = "25bf4334c91a627496dc993b31af65954d3ecccab259202aba230fe43a2f91b5"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "25bf4334c91a627496dc993b31af65954d3ecccab259202aba230fe43a2f91b5"
  }
}
