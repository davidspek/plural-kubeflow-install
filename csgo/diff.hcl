metadata {
  path = "csgo"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "csgo/terraform"
  target  = "csgo/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "csgo/terraform"
  target  = "csgo/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "csgo",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "csgo"
  target  = "csgo/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "csgo",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "csgo/helm"
  target  = "csgo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "csgo",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
