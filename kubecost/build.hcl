metadata {
  name = "kubecost"
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
  path = "helm/kubecost"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "72618f9fd1af2773db2e0971550b3bbce4d3524d3e3f5615685b0cc772fc054c"
    retries = 0
  }
}
