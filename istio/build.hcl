metadata {
  name = "istio"
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
  path = "helm/istio"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "9a6a79c17c2c96ff88f846c7cf0697f4d9a1f3fa6b6311b33ee4b4bf428b4670"
  }
}
