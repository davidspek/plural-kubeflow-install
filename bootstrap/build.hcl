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

    sha = "129af0a946f7049895008ecd66e0c36d324bc872b34a078a06bae745e4313f07"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "129af0a946f7049895008ecd66e0c36d324bc872b34a078a06bae745e4313f07"
  }
}
