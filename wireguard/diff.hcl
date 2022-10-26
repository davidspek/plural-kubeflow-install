metadata {
  path = "wireguard"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "wireguard/terraform"
  target  = "wireguard/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "wireguard/terraform"
  target  = "wireguard/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "wireguard",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "wireguard"
  target  = "wireguard/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "wireguard",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "wireguard/helm"
  target  = "wireguard/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "wireguard",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
