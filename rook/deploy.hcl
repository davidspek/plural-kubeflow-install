metadata {
  path = "rook"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "rook/terraform"
  target  = "rook/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
}

step "terraform-apply" {
  wkdir   = "rook/terraform"
  target  = "rook/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = ""
  retries = 1
}

step "terraform-output" {
  wkdir   = "rook"
  target  = "rook/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = ""
  retries = 0
}

step "crds" {
  wkdir   = "rook"
  target  = "rook/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "rook",
  ]

  sha     = ""
  retries = 0
}

step "bounce" {
  wkdir   = "rook"
  target  = "rook/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "rook",
  ]

  sha     = ""
  retries = 1
}
