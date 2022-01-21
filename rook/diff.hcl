metadata {
  path = "rook"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "rook/terraform"
  target  = "rook/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "rook/terraform"
  target  = "rook/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "rook",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "rook"
  target  = "rook/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "rook",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "rook/helm"
  target  = "rook/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "rook",
  ]

  sha     = ""
  retries = 0
}
