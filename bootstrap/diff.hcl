metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:1LkcCjtecCpI4hg3lD/Kj0kyEAfn+xqE1NHyD1f1k6c="
  retries = 0
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
    "bootstrap",
  ]

  sha     = "cf5de21aaac00f7a5bd8808ece6e231cb7f666526ddbb5347653b10d9645923e"
  retries = 0
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

  sha     = "h1:Wa12sLpBzD4QkKKo1XSzoaui325Tp53QYGKP3BtuJbE="
  retries = 0
}
