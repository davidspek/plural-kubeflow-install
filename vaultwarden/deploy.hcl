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

  sha     = "h1:Mm1tKIWKge9r7Qq8eXldUWdMO1uhgsn/go7l5HHzO+U="
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

  sha     = "h1:Mm1tKIWKge9r7Qq8eXldUWdMO1uhgsn/go7l5HHzO+U="
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

  sha     = "h1:Mm1tKIWKge9r7Qq8eXldUWdMO1uhgsn/go7l5HHzO+U="
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

  sha     = "64d5b67152e442c5342238996d4130b3d663004759e16d56982251aa4482ba6b"
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

  sha     = "h1:t91VSYiSH6UU0+TeiJsel08B4BGYQKUU0cvSVdX5qts="
  retries = 1
}