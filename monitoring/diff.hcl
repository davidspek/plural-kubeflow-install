metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:w1b25G/DxYyNQUCWY2aPkF0leY7RoWhJ608XPqBxUTo="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha     = "h1:w1b25G/DxYyNQUCWY2aPkF0leY7RoWhJ608XPqBxUTo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha     = "9847c6e211cfca07250dc006a2e4ff6548a64c373033a016208500f25d43f4ec"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:mbxLW4Ochci6lan9XT34MSn38+CLYndPrFCJnFk3eA4="
  retries = 0
  verbose = false
}
