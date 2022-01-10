metadata {
  path = "chatwoot"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:9mBR26I+6Dyq/jqfn/2GcOVwzxmcdwgI3loNsNiRywg="
  retries = 0
}

step "terraform" {
  wkdir   = "chatwoot/terraform"
  target  = "chatwoot/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "chatwoot",
  ]

  sha     = "7fe43ed63ed6dc1bc7b2c9d40f963e22af3424f8fb613f018bd4d61611ec3e9d"
  retries = 0
}

step "helm" {
  wkdir   = "chatwoot/helm"
  target  = "chatwoot/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "chatwoot",
  ]

  sha     = "h1:xyqS06aP/MaeBsBNKeJunkdMmq0X2n2jUcG2WIGnpBE="
  retries = 0
}
