metadata {
  path = "redash"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redash/terraform"
  target  = "redash/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Yf3PEWp0sxxUK2FOxlQ7K3lYPgDBiLCrFeCeSv+T2ZQ="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "redash/terraform"
  target  = "redash/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Yf3PEWp0sxxUK2FOxlQ7K3lYPgDBiLCrFeCeSv+T2ZQ="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "redash"
  target  = "redash/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "redash",
  ]

  sha     = "h1:Yf3PEWp0sxxUK2FOxlQ7K3lYPgDBiLCrFeCeSv+T2ZQ="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "redash"
  target  = "redash/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ee42fd87fb8bec17b3fdcc3c659c7b65ebf613c1e6d116c120af3fed3fc1868f"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "redash"
  target  = "redash/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redash",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "redash"
  target  = "redash/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redash",
  ]

  sha     = "h1:f+2BMWd7GK7ZikEm2Wm7BsNwxvA0EU+SUU+2kgsk2UA="
  retries = 1
  verbose = false
}
