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

    sha = "1d60da7cf7ed91ed33724a878fbde714c4935437c210977beda4dc3946b8f21c"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "1d60da7cf7ed91ed33724a878fbde714c4935437c210977beda4dc3946b8f21c"
  }
}
