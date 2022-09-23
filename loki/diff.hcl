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

  sha     = "97586629fdb799746cb663f0955ed1b5aba5674a6f642bfee43f80333d53905d"
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

  sha     = "h1:i1KYKCYQgoO2gie2UUMTAzw/5oFvsB60DrmRUMDGlDw="
  retries = 0
  verbose = false
}
