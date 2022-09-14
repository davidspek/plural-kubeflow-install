metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:d1hQJFQJks5kCmrvgY4nOJ4hlJBU3WHkx6DSFAf8OXI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:d1hQJFQJks5kCmrvgY4nOJ4hlJBU3WHkx6DSFAf8OXI="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:d1hQJFQJks5kCmrvgY4nOJ4hlJBU3WHkx6DSFAf8OXI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "717aef1cb8d4da9d5123bc2c51297e25a13e70c8ecb6b32eaf6ead72fddd8267"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:+lJJ2uC2ZmgXUVgNbgqQ33mHXFSK+NpPeImN3UV63ys="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:/+2KY4XpcIdn59u3woVixDmS0hwPuASS5LLBZYDE0gg="
  retries = 2
  verbose = false
}
