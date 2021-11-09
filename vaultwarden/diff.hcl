metadata {
  path = "vaultwarden"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
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

  sha     = ""
  retries = 0
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

  sha     = ""
  retries = 0
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

  sha     = ""
  retries = 0
}
