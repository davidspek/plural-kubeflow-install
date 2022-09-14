metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:d1hQJFQJks5kCmrvgY4nOJ4hlJBU3WHkx6DSFAf8OXI="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "bootstrap",
  ]

  sha     = "717aef1cb8d4da9d5123bc2c51297e25a13e70c8ecb6b32eaf6ead72fddd8267"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha     = "h1:/+2KY4XpcIdn59u3woVixDmS0hwPuASS5LLBZYDE0gg="
  retries = 0
  verbose = false
}
