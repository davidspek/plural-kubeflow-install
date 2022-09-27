metadata {
  path = "ray"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "ray/terraform"
  target  = "ray/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ray",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "ray"
  target  = "ray/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ray",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "ray/helm"
  target  = "ray/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ray",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
