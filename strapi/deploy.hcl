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

  sha     = "h1:6idxrn9Tu4uG9MfZre8iw4FuQPFCUuAAx6dfQF5cGo0="
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

  sha     = "h1:6idxrn9Tu4uG9MfZre8iw4FuQPFCUuAAx6dfQF5cGo0="
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

  sha     = "h1:6idxrn9Tu4uG9MfZre8iw4FuQPFCUuAAx6dfQF5cGo0="
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

  sha     = "93ac480cebf261cf998623fb4dd009de69bc0a33f0ae785d1fec8923ad9732bf"
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

  sha     = "h1:hNS/xAOa4q8koRblGs6XcdzsI3N9K2eFcinDt6++yIE="
  retries = 2
  verbose = false
}
