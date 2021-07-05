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

    sha = "343eb265ee42c632908e9a5f44cef178e93061a1705f9606314627f193d9cde7"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "343eb265ee42c632908e9a5f44cef178e93061a1705f9606314627f193d9cde7"
  }
}
