metadata {
  name = "datahub"
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
  path = "helm/datahub"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "5d55f18100ed6065fabe9a7d5e7a6896d08f0d46cccafc391f277a479c40f22f"
    retries = 0
    verbose = false
  }
}
