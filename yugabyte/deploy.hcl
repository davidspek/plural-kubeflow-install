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

  sha     = "255bddad88b79019bbd690608d68529a6a6688c9d3b683d19a30f94eb3cb259c"
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

  sha     = "h1:8XuSB5x2CPq0jLWQxX5jW82NPOmJP6qKYFDJzEl+GPI="
  retries = 1
  verbose = false
}
