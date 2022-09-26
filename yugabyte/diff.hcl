metadata {
  path = "yugabyte"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:FDmdaSc+4CmHwH3P8BK4rQtS2qvBbCBLjQOXHxOjFFY="
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

  sha     = "h1:FDmdaSc+4CmHwH3P8BK4rQtS2qvBbCBLjQOXHxOjFFY="
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

  sha     = "02332dfa99a61537a607b930a26dd2c979416146aaaede4f0ac69d77446ffb45"
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

  sha     = "h1:x7w0VLvN4R8vmxl2pIQAp6uVm9Rek9i8PFADtK6Ha1Q="
  retries = 0
  verbose = false
}
