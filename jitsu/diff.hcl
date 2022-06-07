metadata {
  path = "jitsu"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "jitsu",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "jitsu"
  target  = "jitsu/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "jitsu",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "jitsu/helm"
  target  = "jitsu/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "jitsu",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
