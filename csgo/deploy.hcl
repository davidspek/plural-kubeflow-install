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

  sha     = "5e4a025866c9feedfbd02eaa2af18d6ba4b90d4459edfa8ceb064d0504375083"
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

  sha     = "h1:EoJ6G4UXLxvYJVxvOw0BpOv3IYFaGLjALChMS0gXdzI="
  retries = 2
  verbose = false
}
