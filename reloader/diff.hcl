metadata {
  path = "reloader"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "reloader/terraform"
  target  = "reloader/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "reloader/terraform"
  target  = "reloader/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "reloader",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "reloader"
  target  = "reloader/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "reloader",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "reloader/helm"
  target  = "reloader/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "reloader",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
