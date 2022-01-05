metadata {
  path = "chatwoot"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:wY96BkANzRtnJWmgV3F4p3R6SxPSrLFi2vIg9O//zf4="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:wY96BkANzRtnJWmgV3F4p3R6SxPSrLFi2vIg9O//zf4="
  retries = 1
}

step "terraform-output" {
  wkdir   = "chatwoot"
  target  = "chatwoot/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "chatwoot",
  ]

  sha     = "h1:wY96BkANzRtnJWmgV3F4p3R6SxPSrLFi2vIg9O//zf4="
  retries = 0
}

step "kube-init" {
  wkdir   = "chatwoot"
  target  = "chatwoot/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "edcb17c7d941652fbf44d189c442ffec9a18769bab4773a15d2807242ad9bb9f"
  retries = 0
}

step "crds" {
  wkdir   = "chatwoot"
  target  = "chatwoot/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "chatwoot",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "chatwoot"
  target  = "chatwoot/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "chatwoot",
  ]

  sha     = "h1:noMMIoaofd7gX6Oj46u+KQgLZL5YCa2ezea1WKRL0P4="
  retries = 1
}
