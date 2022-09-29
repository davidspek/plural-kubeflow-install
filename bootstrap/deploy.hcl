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

  sha     = "h1:tcx3mBFCrKfwQ6gbCrDrysD/HEwCO1yZgPOTCxR27ds="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:tcx3mBFCrKfwQ6gbCrDrysD/HEwCO1yZgPOTCxR27ds="
  retries = 2
  verbose = false
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

  sha     = "h1:tcx3mBFCrKfwQ6gbCrDrysD/HEwCO1yZgPOTCxR27ds="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "eecb6314cf4ae337dcba3f35bc21ed8df9d41534d32bfe2fb2f0708b8eb8ca8f"
  retries = 0
  verbose = false
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

  sha     = "h1:+lJJ2uC2ZmgXUVgNbgqQ33mHXFSK+NpPeImN3UV63ys="
  retries = 0
  verbose = false
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

  sha     = "h1:O6rDtivsiQHNh2eCCPJ6rehiKefFhth1rN4U7herTG8="
  retries = 2
  verbose = false
}
