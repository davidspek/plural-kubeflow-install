metadata {
  path = "csgo"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "csgo/terraform"
  target  = "csgo/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:d4dDsQ6k4xFXzSNCTDlTnW2i/46/jKUScZVBeeuTA6Y="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "csgo/terraform"
  target  = "csgo/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:d4dDsQ6k4xFXzSNCTDlTnW2i/46/jKUScZVBeeuTA6Y="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "csgo"
  target  = "csgo/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "csgo",
  ]

  sha     = "h1:d4dDsQ6k4xFXzSNCTDlTnW2i/46/jKUScZVBeeuTA6Y="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "csgo"
  target  = "csgo/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1b4ae00254349061207f3619cb70343a4dfe24e8b0b307e7a3e292a10ea32453"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "csgo"
  target  = "csgo/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "csgo",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "csgo"
  target  = "csgo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "csgo",
  ]

  sha     = "h1:xvXuY18rFYvXvxUcTTgGEIXH/v6bsKoxNcPC1/4YS58="
  retries = 2
  verbose = false
}
