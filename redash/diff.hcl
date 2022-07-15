metadata {
  path = "redash"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "redash/terraform"
  target  = "redash/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "redash/terraform"
  target  = "redash/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "redash",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "redash"
  target  = "redash/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "redash",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "redash/helm"
  target  = "redash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "redash",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
