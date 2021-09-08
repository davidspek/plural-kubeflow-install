metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:MHrYN/qcf8WnIChfPoVr13HFkc9ETJCBz1DZv65mFG0="
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha = "h1:MHrYN/qcf8WnIChfPoVr13HFkc9ETJCBz1DZv65mFG0="
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha = "a7db3bee90be6b1600c3494fe0d44920b18d7e055b621560c7af93a03833c0a3"
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha = "h1:BenzIzL/g8e7iHKchBgTcB8BBEc+sK2Ph1lJqE1VWzQ="
}
