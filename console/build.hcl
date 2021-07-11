metadata {
  name = "console"
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
  path = "helm/console"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "console",
      "cm://app.plural.sh/cm/console",
    ]

    sha = "3bf52d040a86fdb298d0033ad087b9ccc6b8837b6f641cbced642ff9792c759b"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "3bf52d040a86fdb298d0033ad087b9ccc6b8837b6f641cbced642ff9792c759b"
  }
}
