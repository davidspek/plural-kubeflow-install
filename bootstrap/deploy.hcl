metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:dDbzRQRqCP7Xp+Y2bwPYFvlqyQoBuGKN8N3/H2DdPWU="
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

  sha     = "h1:dDbzRQRqCP7Xp+Y2bwPYFvlqyQoBuGKN8N3/H2DdPWU="
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

  sha     = "h1:dDbzRQRqCP7Xp+Y2bwPYFvlqyQoBuGKN8N3/H2DdPWU="
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

  sha     = "25b21d57a5e2eb3da69ef2c8b0a4617cf1185201c9529bc9b679785880d20867"
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

  sha     = "h1:87HgCFO9UzQtu1bGfDh0UqB/DoSCEbd+LITbuax7CHU="
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

  sha     = "h1:o/p0ObmnYk8ZHG/Sazw8QMb7i8giC+0JPrpYhtKVmjc="
  retries = 0
}
