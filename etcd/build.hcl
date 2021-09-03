metadata {
  name = "etcd"
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
  path = "helm/etcd"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha = "3c3a09eaf3b7b2bf10492be69bbf12b2ba893a2612176e3857e039a89f376ebb"
  }
}
