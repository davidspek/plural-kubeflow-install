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

  sha     = "51cc228960c781bfaae8335dcaa21b502e08d63f50d5bf84409c0f553b829e8c"
  retries = 0
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

  sha     = "h1:SNHTJ5YHXh8HYsBFEjlaCVCP/ivqvYdrgD9U5ZWVoWs="
  retries = 0
}
