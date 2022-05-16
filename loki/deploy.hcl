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

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
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

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
  retries = 1
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

  sha     = "h1:RDlxAjt7pGMWXCMucJ7W6HfofpwVu/L7b9Wyv6j+4iU="
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

  sha     = "f0ef1d70d7db58ae71759c1cad8d257e803104506f0f7d85aca3341a4435b699"
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

  sha     = "h1:oS8Rx6ATyAjlDSq02rhUIqLHu3Ip9bi0YS8XmHppsHY="
  retries = 1
  verbose = false
}
