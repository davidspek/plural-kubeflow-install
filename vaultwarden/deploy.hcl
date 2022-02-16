metadata {
  path = "vaultwarden"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:MzODpslojtZTypEC9DgOqI2gQPtCx40gtuGQMZ3hBuw="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "vaultwarden/terraform"
  target  = "vaultwarden/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:MzODpslojtZTypEC9DgOqI2gQPtCx40gtuGQMZ3hBuw="
  retries = 1
}

step "terraform-output" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "vaultwarden",
  ]

  sha     = "h1:MzODpslojtZTypEC9DgOqI2gQPtCx40gtuGQMZ3hBuw="
  retries = 0
}

step "kube-init" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "440c7bf7a49187f6c74561b51383c11ba147059358f4fb61046479e2e030f634"
  retries = 0
}

step "crds" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "vaultwarden",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "vaultwarden"
  target  = "vaultwarden/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "vaultwarden",
  ]

  sha     = "h1:dEgM24xdpKwbG7vySXoTqx7oGpaUYexTlSnzS/2CRFE="
  retries = 1
}
