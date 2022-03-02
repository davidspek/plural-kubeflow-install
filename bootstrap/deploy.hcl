metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:1LkcCjtecCpI4hg3lD/Kj0kyEAfn+xqE1NHyD1f1k6c="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:1LkcCjtecCpI4hg3lD/Kj0kyEAfn+xqE1NHyD1f1k6c="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:1LkcCjtecCpI4hg3lD/Kj0kyEAfn+xqE1NHyD1f1k6c="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "cf5de21aaac00f7a5bd8808ece6e231cb7f666526ddbb5347653b10d9645923e"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:j5D+5+iySfxsUnOBV14mh+lWvBCTTadIY3uJaCybW9g="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:Wa12sLpBzD4QkKKo1XSzoaui325Tp53QYGKP3BtuJbE="
  retries = 1
}
