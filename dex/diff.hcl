metadata {
  path = "dex"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
}

step "terraform" {
  wkdir   = "dex/terraform"
  target  = "dex/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "dex",
  ]

  sha = ""
}

step "kube-init" {
  wkdir   = "dex"
  target  = "dex/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "dex",
  ]

  sha = ""
}

step "helm" {
  wkdir   = "dex/helm"
  target  = "dex/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "dex",
  ]

  sha = ""
}
