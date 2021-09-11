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

  sha = "684e00546b513a1cd5db0306cf07eb167929c7eecc8e0688716a83907ff4c5b3"
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

  sha = "h1:7zdRbDUzQaEommdphykphsrQych5VUKpGGnXbQBDg/Q="
}
