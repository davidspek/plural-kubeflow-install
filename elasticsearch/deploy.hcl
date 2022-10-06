metadata {
  path = "elasticsearch"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:IT8JCIn4VFQEFQ+kZI17ySgffZvYNQhivTJZbj/Hf1E="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:IT8JCIn4VFQEFQ+kZI17ySgffZvYNQhivTJZbj/Hf1E="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "elasticsearch",
  ]

  sha     = "h1:IT8JCIn4VFQEFQ+kZI17ySgffZvYNQhivTJZbj/Hf1E="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "2e7d907fdd5740488522144731254a7cc1945e0e44a9922602b5e738e6332fca"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "elasticsearch",
  ]

  sha     = "h1:DwqXf+vVVp7K1KyleGMN514fujSfJ8T+OHHBOiyqry8="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "elasticsearch",
  ]

  sha     = "h1:/Eg6NLV3tUbAXb008Eh9wycaFtDbB2O6abgsA5clvjA="
  retries = 2
  verbose = false
}
