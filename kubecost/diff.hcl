metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:kLRldCGatDPsVQ/7dIw2RHth/Qg3uZXteT7AWw72SUU="
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

  sha     = "h1:kLRldCGatDPsVQ/7dIw2RHth/Qg3uZXteT7AWw72SUU="
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

  sha     = "6d44469de48e1d4acf348e76e9053c9e8e0f4130a71d55e84d8dc90c7daaab24"
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

  sha     = "h1:Hpm1lePdV0nwbhf4Zn1An8bfWPhSYSmU7xuzuNDUXGw="
  retries = 0
}
