metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:vJhTQpP1v7dimOfD9ngKkvBmcBwNhP0x5A0rD2kCQ5k="
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

  sha     = "h1:vJhTQpP1v7dimOfD9ngKkvBmcBwNhP0x5A0rD2kCQ5k="
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

  sha     = "ff04524152f2f3e06de54a9e78dcaa6775a605e563f6a7f9810fa1aa940fa59f"
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

  sha     = "h1:h8EX1P9fAK7qd9zdrIaI5gihXwJqSeb9XABPnKwhFkk="
  retries = 0
  verbose = false
}
