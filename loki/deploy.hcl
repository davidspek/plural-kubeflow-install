metadata {
  path = "loki"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:JGakh60qExcxrN7qr+bn11msf3de0j1S+eBwUfmO8bo="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "loki/terraform"
  target  = "loki/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:JGakh60qExcxrN7qr+bn11msf3de0j1S+eBwUfmO8bo="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "loki"
  target  = "loki/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "loki",
  ]

  sha     = "h1:JGakh60qExcxrN7qr+bn11msf3de0j1S+eBwUfmO8bo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "loki"
  target  = "loki/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "f43762cad30d4a29d736014db66e995f39f50cd26a3f4307da682414f808f234"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "loki"
  target  = "loki/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "loki",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "loki"
  target  = "loki/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "loki",
  ]

  sha     = "h1:i1KYKCYQgoO2gie2UUMTAzw/5oFvsB60DrmRUMDGlDw="
  retries = 2
  verbose = false
}
