metadata {
  path = "strapi"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "strapi/terraform"
  target  = "strapi/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:QKGfEIoS5ETXOpXEHX0hoV4kgG8/p/uGwk6mCTbFlTI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "strapi/terraform"
  target  = "strapi/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:QKGfEIoS5ETXOpXEHX0hoV4kgG8/p/uGwk6mCTbFlTI="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "strapi"
  target  = "strapi/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "strapi",
  ]

  sha     = "h1:QKGfEIoS5ETXOpXEHX0hoV4kgG8/p/uGwk6mCTbFlTI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "strapi"
  target  = "strapi/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d065b665909d6d426adcd0d655b63e04a3aeb1360d84f1be09cfb45974d2f5ed"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "strapi"
  target  = "strapi/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "strapi",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "strapi"
  target  = "strapi/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "strapi",
  ]

  sha     = "h1:qhWSqyYLDU+9Us20UwY49zvAky3IQnlbbCjO2fJej7w="
  retries = 2
  verbose = false
}
