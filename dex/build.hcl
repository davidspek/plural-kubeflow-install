metadata {
  name = "dex"
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
  path = "helm/dex"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "dex",
      "cm://app.plural.sh/cm/dex",
    ]

    sha = "ca5b2d1da99b6b72b345d0c2e007ac93893306b6d64b301d7dfa2efe861d1f37"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "ca5b2d1da99b6b72b345d0c2e007ac93893306b6d64b301d7dfa2efe861d1f37"
  }
}
