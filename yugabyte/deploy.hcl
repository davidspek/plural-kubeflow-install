metadata {
  path = "yugabyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:FDmdaSc+4CmHwH3P8BK4rQtS2qvBbCBLjQOXHxOjFFY="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:FDmdaSc+4CmHwH3P8BK4rQtS2qvBbCBLjQOXHxOjFFY="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "yugabyte"
  target  = "yugabyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "2036de9997159cf16b6578d1c6c6891c2048a23673670deeb0f1967aa12ba3a1"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "yugabyte"
  target  = "yugabyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "yugabyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "yugabyte"
  target  = "yugabyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "yugabyte",
  ]

  sha     = "h1:/xYrnBKNr3EN+OogjzJWUigF3oY6jidVPXWlaIzTawc="
  retries = 2
  verbose = false
}
