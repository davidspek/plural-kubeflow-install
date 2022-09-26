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

  sha     = "4edebe47669ae419da38b1b566fbce78eab6505b267bf7d45c0b46d167b8f5ff"
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

  sha     = "h1:/xYrnBKNr3EN+OogjzJWUigF3oY6jidVPXWlaIzTawc="
  retries = 0
  verbose = false
}
