metadata {
  path = "loki"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:JGakh60qExcxrN7qr+bn11msf3de0j1S+eBwUfmO8bo="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "loki",
  ]

  sha     = "h1:JGakh60qExcxrN7qr+bn11msf3de0j1S+eBwUfmO8bo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "loki"
  target  = "loki/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "loki",
  ]

  sha     = "58370a9e21c6dd048409878376fa5198b455bc4388cd7d6c2c980c2d7ea744bc"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "loki/helm"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "loki",
  ]

  sha     = "h1:AjMu2oMPk2PGamYTQxUE9H7S0roYW6YzGCAxkaqcxL4="
  retries = 0
  verbose = false
}
