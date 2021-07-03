metadata {
  name = "istio"
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
  path = "helm/istio"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "istio",
      "cm://app.plural.sh/cm/istio",
    ]

    sha = "e395b77e965ba34c186fc0fcd9c20f0510f0ad2596af0f139ade5e83e8f5589a"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "e395b77e965ba34c186fc0fcd9c20f0510f0ad2596af0f139ade5e83e8f5589a"
  }
}
