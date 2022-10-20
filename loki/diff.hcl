metadata {
  path = "loki"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"
  args    = ["init"]
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

  sha     = "aac8d3f3f76578215d446c0dc2ab4bbb770516d35333b50ea6b992f7fb8eb402"
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

  sha     = "h1:KBmZRaOQIFvIWCYCrUTEq0F7F0gcg9l0OgCJcGAq0e8="
  retries = 0
  verbose = false
}
