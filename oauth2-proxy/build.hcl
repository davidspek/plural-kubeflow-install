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

    sha = "1ab974ff5c4d306fcd897185aa017e0357988e6cff8fb5c3ae711cb04a93a4ed"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "1ab974ff5c4d306fcd897185aa017e0357988e6cff8fb5c3ae711cb04a93a4ed"
  }
}
