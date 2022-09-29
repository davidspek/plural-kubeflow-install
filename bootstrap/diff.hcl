metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tcx3mBFCrKfwQ6gbCrDrysD/HEwCO1yZgPOTCxR27ds="
  retries = 0
  verbose = false
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
    "bootstrap",
  ]

  sha     = "eecb6314cf4ae337dcba3f35bc21ed8df9d41534d32bfe2fb2f0708b8eb8ca8f"
  retries = 0
  verbose = false
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

  sha     = "h1:O6rDtivsiQHNh2eCCPJ6rehiKefFhth1rN4U7herTG8="
  retries = 0
  verbose = false
}
