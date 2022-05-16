metadata {
  path = "vaultwarden"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:MzODpslojtZTypEC9DgOqI2gQPtCx40gtuGQMZ3hBuw="
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

  sha     = "h1:MzODpslojtZTypEC9DgOqI2gQPtCx40gtuGQMZ3hBuw="
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

  sha     = "e5754a3d9338d674c4fd7f2de0a8b4666b82cad5fbadd2ef2ecfeb8a0f01d44a"
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

  sha     = "h1:dEgM24xdpKwbG7vySXoTqx7oGpaUYexTlSnzS/2CRFE="
  retries = 0
  verbose = false
}
