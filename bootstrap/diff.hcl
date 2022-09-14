metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:rGmcwtDYU0Krtu59d6EwMa1R3vSCU0ale9bdn9bFdP0="
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

  sha     = "h1:rGmcwtDYU0Krtu59d6EwMa1R3vSCU0ale9bdn9bFdP0="
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

  sha     = "f70481d4a77bc2fbe05b18ff6e348b58893dd9fc321359330ffce5d094af7a89"
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
