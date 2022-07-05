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

  sha     = "fae66b5f9614b414e149797eaf181a9d59c912633896785b29cae228718f1d97"
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

  sha     = "h1:fmjOZnguwiAG6bus3nQoyTYBxhKB4eArCqbR5hFdELM="
  retries = 1
  verbose = false
}
