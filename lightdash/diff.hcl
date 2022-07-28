metadata {
  path = "lightdash"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "lightdash/terraform"
  target  = "lightdash/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "lightdash",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "lightdash"
  target  = "lightdash/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "lightdash",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "lightdash/helm"
  target  = "lightdash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "lightdash",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
