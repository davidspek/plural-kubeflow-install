metadata {
  path = "yugabyte"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:9Rfq2xPWGA+hKB9+OAscet4kdEgSyW9guJy+Z2A98po="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "yugabyte/terraform"
  target  = "yugabyte/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:9Rfq2xPWGA+hKB9+OAscet4kdEgSyW9guJy+Z2A98po="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "yugabyte"
  target  = "yugabyte/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "yugabyte",
  ]

  sha     = "h1:9Rfq2xPWGA+hKB9+OAscet4kdEgSyW9guJy+Z2A98po="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "yugabyte"
  target  = "yugabyte/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "c98f0bae51f624d0055329e45f51ba42979dcf0548676df68169a879c81142c6"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "yugabyte"
  target  = "yugabyte/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "yugabyte",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "yugabyte"
  target  = "yugabyte/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "yugabyte",
  ]

  sha     = "h1:mqzR/mQR8tFJ97hoodDwThJv7OfZpRwWYVXyvCtIaQY="
  retries = 1
  verbose = false
}
