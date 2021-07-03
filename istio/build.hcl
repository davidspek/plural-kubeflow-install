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

    sha = "e2f643499eae71195fffb1f2a43bd19dc75c94514429277b1f9e5a989292ebbd"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "e2f643499eae71195fffb1f2a43bd19dc75c94514429277b1f9e5a989292ebbd"
  }
}
