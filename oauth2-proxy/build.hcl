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

    sha = "46bae67387937782805ca9031e62e5023e953e6c18438a82a4dfb8d3046d24be"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "46bae67387937782805ca9031e62e5023e953e6c18438a82a4dfb8d3046d24be"
  }
}
