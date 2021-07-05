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

    sha = "01af231bbaa68579c28e614b49d3c15146064c19a297abcbc4b607c8559d8e73"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "01af231bbaa68579c28e614b49d3c15146064c19a297abcbc4b607c8559d8e73"
  }
}
