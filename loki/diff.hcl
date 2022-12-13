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

  sha     = "05cda7ea101dd53484f0733e5881ee3574364d689eff209a5a385b921c5f080c"
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

  sha     = "h1:zvAIccPPOe2OLmbl02X0Ye7ozl3Yb08NyoV61OpDpZk="
  retries = 0
  verbose = false
}
