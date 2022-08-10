metadata {
  path = "test-harness"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "test-harness/terraform"
  target  = "test-harness/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "test-harness/terraform"
  target  = "test-harness/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "test-harness",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "test-harness"
  target  = "test-harness/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "test-harness",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "test-harness/helm"
  target  = "test-harness/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "test-harness",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
