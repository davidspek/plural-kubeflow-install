metadata {
  name = "dagster"
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
  path = "helm/dagster"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "505b645f1de9fdcfe60f999185be741566c0509d33528fca5fded9100292d29f"
    retries = 0
    verbose = false
  }
}
