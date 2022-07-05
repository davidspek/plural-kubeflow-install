metadata {
  path = "vaultwarden"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:l31gNLESDOdXFJtltq/o4A45cBhmiHUZLHb2wIwS0QM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "vaultwarden",
  ]

  sha     = "h1:l31gNLESDOdXFJtltq/o4A45cBhmiHUZLHb2wIwS0QM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "vaultwarden",
  ]

  sha     = "0faf5f86e33c8bd4f0cae82c269c64313a45d5ce8d0e8fb2c095821fb681c9aa"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "vaultwarden/helm"
  target  = "vaultwarden/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "vaultwarden",
  ]

  sha     = "h1:rUUAIsbPP7EzUkBpry+CzK8zrvGyZP6sMSu+OmD3fBA="
  retries = 0
  verbose = false
}
