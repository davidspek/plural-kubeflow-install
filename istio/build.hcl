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

    sha = "83dd28764759d5e6b1d632128e14ba1753d9ee765f060637c7571f9e77b30cba"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "83dd28764759d5e6b1d632128e14ba1753d9ee765f060637c7571f9e77b30cba"
  }
}
