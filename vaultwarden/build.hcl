metadata {
  name = "vaultwarden"
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
  path = "helm/vaultwarden"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "7cdef146aa9bb19ea34b759ef414d28d1ee08e0fd772cdfb80326fe78b12d160"
    retries = 0
  }
}
