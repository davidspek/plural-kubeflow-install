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

    sha = "c77824cbb8aa3ef75311eb83dd576fd61c95089c353e12a2410ad87465815386"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "c77824cbb8aa3ef75311eb83dd576fd61c95089c353e12a2410ad87465815386"
  }
}
