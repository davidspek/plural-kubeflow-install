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

    sha = "7b5f0a2b75c85f2540a4f346aae6c2f87f7b12d7d18fef71c618d309d4a47e15"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "7b5f0a2b75c85f2540a4f346aae6c2f87f7b12d7d18fef71c618d309d4a47e15"
  }
}
