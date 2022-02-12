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

  sha     = "4a6c944a599199c0ed81e4506a5b930914d0f7f49122432dd175cc858c9687bc"
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

  sha     = "h1:frxjWvmo+PeXAUrFdkSXpyvhiadHu474Qin8FUEsXHY="
  retries = 0
}
