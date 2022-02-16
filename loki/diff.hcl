metadata {
  path = "loki"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "loki",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "loki"
  target  = "loki/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "loki",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "loki/helm"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "loki",
  ]

  sha     = ""
  retries = 0
}
