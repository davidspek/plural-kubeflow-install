metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:fWYL6gmyXT0XZmxqdH3pLGPUEVTQ7JqhBhk+0sOsPnQ="
  retries = 0
}

step "terraform" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubecost",
  ]

  sha     = "h1:fWYL6gmyXT0XZmxqdH3pLGPUEVTQ7JqhBhk+0sOsPnQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubecost",
  ]

  sha     = "5e76a2d78945d99fa8dcc991469a6ab5b043ca84f5d387f75790de826ebde554"
  retries = 0
}

step "helm" {
  wkdir   = "kubecost/helm"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubecost",
  ]

  sha     = "h1:P2OsyLYt9OBYvQ+sNt8pvyYI7ck9HKn2kGB8zxpdJu0="
  retries = 0
}
