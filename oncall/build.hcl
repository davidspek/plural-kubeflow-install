metadata {
  name = "oncall"
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
  path = "helm/oncall"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "e96f2533113dfd490dfe066d967f70cd14fc25c0eff20c0cc4262a614cf00ff3"
    retries = 0
    verbose = false
  }
}
