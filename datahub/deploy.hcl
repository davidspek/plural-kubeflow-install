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

  sha     = "a459a0ed826efa0573167286b21271947f6688edaaf045f486deb70ed671de82"
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

  sha     = "h1:/zc4qRkbE1/aiUwM1OZMAPiQFLyFe7Bk0n8X3D6zRsk="
  retries = 2
  verbose = false
}
