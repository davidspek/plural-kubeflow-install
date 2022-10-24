metadata {
  path = "nocodb"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "nocodb/terraform"
  target  = "nocodb/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "nocodb",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "nocodb"
  target  = "nocodb/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "nocodb",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "nocodb/helm"
  target  = "nocodb/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "nocodb",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
