metadata {
  name = "nvidia-operator"
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
  path = "helm/nvidia-operator"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "98e08eeb59cfb6c1ebb91822eba33a9cda4d5ac4b8fed7fffc0456cc64affdec"
    retries = 0
  }
}
