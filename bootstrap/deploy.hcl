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

  sha     = "h1:uKzw3RWhM1NhVfFxkJdB/uz7Bm+w4fI4BhGtMu3PcaI="
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

  sha     = "h1:uKzw3RWhM1NhVfFxkJdB/uz7Bm+w4fI4BhGtMu3PcaI="
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

  sha     = "h1:uKzw3RWhM1NhVfFxkJdB/uz7Bm+w4fI4BhGtMu3PcaI="
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

  sha     = "cf5d6330b0b3604d11a991685bf1a994194605c3cc51078cd13dbac2e1c948bd"
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

  sha     = "h1:8TJIeRoM7ENjBr6dasKectNqvpvYT2zT1SgcWSK0XIA="
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

  sha     = "h1:pqRNZffetRxPbCci/NX6JDtByesb2Yap2jFyABa3UUc="
  retries = 1
}
