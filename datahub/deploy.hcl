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

  sha     = "f6f44bf5ce397ef10ebcbd207dbb0504cea11d05934a939c3167b13d81172c4c"
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

  sha     = "h1:o6NA90kfZ3xXF4brVqOJZCqM0yBw8d7s8h20btziaDM="
  retries = 2
  verbose = false
}
