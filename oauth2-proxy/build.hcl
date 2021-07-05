metadata {
  name = "oauth2-proxy"
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
  path = "helm/oauth2-proxy"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "oauth2-proxy",
      "cm://app.plural.sh/cm/oauth2-proxy",
    ]

    sha = "8621cb84e9dd69f317530098b3c3beab7058fc53e47117e26e8432c96a0d9a74"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "8621cb84e9dd69f317530098b3c3beab7058fc53e47117e26e8432c96a0d9a74"
  }
}
