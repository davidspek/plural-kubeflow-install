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

    sha = "d6df8405352e9ccdea74c84af4209317b5a39ab961f2badca630d71ce17eb237"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "d6df8405352e9ccdea74c84af4209317b5a39ab961f2badca630d71ce17eb237"
  }
}
