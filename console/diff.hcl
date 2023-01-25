metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:nCZop16oMCW/CieUsy/HjxBt2inUiYexyKcEsKznH0w="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:nCZop16oMCW/CieUsy/HjxBt2inUiYexyKcEsKznH0w="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "cf6bd34d4aef3385736b0e5d030637eca0a3a6175c70cf6585abc4a4915939a4"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:rjRxSfYpgvz/G48ZEEGDLLqunmiRFGhY3jGmtDnOLv0="
  retries = 0
  verbose = false
}
