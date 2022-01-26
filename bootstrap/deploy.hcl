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

  sha     = "h1:V2unp3ir8cAkkVQC7xbP5rKanmchKltIu++SDvjMIQo="
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

  sha     = "h1:V2unp3ir8cAkkVQC7xbP5rKanmchKltIu++SDvjMIQo="
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
  ]

  sha     = "7da47839d70068f5fd907424414b30c2b290db4638596df163edeec5a18bf800"
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

  sha     = "h1:Z9V8VXiNkbBTXY5Kpd0F+OQpyWzek/JQMuwwiREvraY="
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

  sha     = "h1:88I8yU8JWc6KgRtjEycn8YZlTHCLajg6O5BLLbw6TRs="
  retries = 1
}
