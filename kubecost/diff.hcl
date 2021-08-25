metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
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

  sha = ""
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

  sha = ""
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

  sha = ""
}
