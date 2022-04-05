metadata {
  path = "renovate"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "renovate/terraform"
  target  = "renovate/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "renovate",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "renovate"
  target  = "renovate/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "renovate",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "renovate/helm"
  target  = "renovate/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "renovate",
  ]

  sha     = ""
  retries = 0
}
