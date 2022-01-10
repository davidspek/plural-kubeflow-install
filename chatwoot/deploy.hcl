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

  sha     = "h1:9mBR26I+6Dyq/jqfn/2GcOVwzxmcdwgI3loNsNiRywg="
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

  sha     = "h1:9mBR26I+6Dyq/jqfn/2GcOVwzxmcdwgI3loNsNiRywg="
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

  sha     = "h1:9mBR26I+6Dyq/jqfn/2GcOVwzxmcdwgI3loNsNiRywg="
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

  sha     = "7fe43ed63ed6dc1bc7b2c9d40f963e22af3424f8fb613f018bd4d61611ec3e9d"
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

  sha     = "h1:xyqS06aP/MaeBsBNKeJunkdMmq0X2n2jUcG2WIGnpBE="
  retries = 1
}
