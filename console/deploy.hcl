metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:u7B85IBUNbBtpHSR+Cy5FpP6P0LmAWpLnTwdycn1vdw="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:u7B85IBUNbBtpHSR+Cy5FpP6P0LmAWpLnTwdycn1vdw="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "console",
  ]

  sha     = "h1:u7B85IBUNbBtpHSR+Cy5FpP6P0LmAWpLnTwdycn1vdw="
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
  ]

  sha     = "73d5bc0fc486fc89c264452e59a7600137503b7c5613869d2e39c6d909b414dc"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha     = "h1:7HPyE3yYlAxxvMiFfgFs3XxyjP+bC07Ee4OSuiOaOI0="
  retries = 1
  verbose = false
}
