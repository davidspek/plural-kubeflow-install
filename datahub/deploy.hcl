metadata {
  path = "datahub"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "datahub/terraform"
  target  = "datahub/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "datahub"
  target  = "datahub/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "datahub",
  ]

  sha     = "h1:j7R8zQnjmIqvuXEpFmzSWMRIa5B5GPx9UFn8E70dkDM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "datahub"
  target  = "datahub/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ebb43a33abb03707d0e09d29c179bf397a25df5ec7ed9a8cb217f1d4abd3f212"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "datahub"
  target  = "datahub/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "datahub",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "datahub"
  target  = "datahub/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "datahub",
  ]

  sha     = "h1:h/4zp+gJKFbO4yiCYF/sOiMiM0VerUm0gHR6Lns9yLg="
  retries = 2
  verbose = false
}
