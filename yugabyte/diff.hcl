metadata {
  path = "yugabyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "yugabyte",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "yugabyte"
  target  = "yugabyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "yugabyte",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "yugabyte/helm"
  target  = "yugabyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "yugabyte",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
