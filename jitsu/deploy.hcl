metadata {
  path = "jitsu"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:RVW34KpKxJWS/Uzc2oKRed6WnMHLhiVgGfQ6VwYoOsI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:RVW34KpKxJWS/Uzc2oKRed6WnMHLhiVgGfQ6VwYoOsI="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "jitsu"
  target  = "jitsu/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "jitsu",
  ]

  sha     = "h1:RVW34KpKxJWS/Uzc2oKRed6WnMHLhiVgGfQ6VwYoOsI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "jitsu"
  target  = "jitsu/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5f63730e5a1afa0b7f1f352f1a657bf2199c299e7307f2925b0716bb79c3c880"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "jitsu"
  target  = "jitsu/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "jitsu",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "jitsu"
  target  = "jitsu/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "jitsu",
  ]

  sha     = "h1:uLBCS/6B8B2YqJP2JiVDh3A+t7VlsC6WFDlJNjOQYuk="
  retries = 1
  verbose = false
}
