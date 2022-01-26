metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:V2unp3ir8cAkkVQC7xbP5rKanmchKltIu++SDvjMIQo="
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

  sha     = "h1:V2unp3ir8cAkkVQC7xbP5rKanmchKltIu++SDvjMIQo="
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

  sha     = "7da47839d70068f5fd907424414b30c2b290db4638596df163edeec5a18bf800"
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

  sha     = "h1:88I8yU8JWc6KgRtjEycn8YZlTHCLajg6O5BLLbw6TRs="
  retries = 0
}
