metadata {
  name = "elasticsearch"
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
  path = "helm/elasticsearch"
  type = "helm"

  preflight "add-repo" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "repo",
      "add",
      "elasticsearch",
      "cm://app.plural.sh/cm/elasticsearch",
    ]

    sha = "7d883f99134d2dccec849eca42249f820a9441abc54836ecfe0f3d209d32c20f"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "7d883f99134d2dccec849eca42249f820a9441abc54836ecfe0f3d209d32c20f"
  }
}
