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

    sha     = "0fb07b5b4d754ea5bc9982c15e1ab9e4b019ae1bf87e5d23c1f177253cb29bf8"
    retries = 0
  }
}
