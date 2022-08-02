metadata {
  path = "n8n"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:OyvNVSkD3j1d5DpR10+IbzUxGj+AdHqmnLQhQUf6ZT8="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "n8n/terraform"
  target  = "n8n/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:OyvNVSkD3j1d5DpR10+IbzUxGj+AdHqmnLQhQUf6ZT8="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "n8n"
  target  = "n8n/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "n8n",
  ]

  sha     = "h1:OyvNVSkD3j1d5DpR10+IbzUxGj+AdHqmnLQhQUf6ZT8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "n8n"
  target  = "n8n/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "2f00dd561bea9c2f64c252a39329cb5e938f4b60425ca2b84a94494487f226e0"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "n8n"
  target  = "n8n/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "n8n",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "n8n"
  target  = "n8n/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "n8n",
  ]

  sha     = "h1:P7tzX/+PuSqiNQnN0PW2tjrBzHC4vtO0j57mZ97amEE="
  retries = 1
  verbose = false
}
