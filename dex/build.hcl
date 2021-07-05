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

    sha = "4b3d7e807f08af693143c9afa60932fa4e463634ed62892a0ccfee950ffc47ee"
  }

  preflight "update-deps" {
    wkdir   = ""
    target  = "requirements.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "4b3d7e807f08af693143c9afa60932fa4e463634ed62892a0ccfee950ffc47ee"
  }
}
