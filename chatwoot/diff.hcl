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

  sha     = "1a7d86f0857d1ba945ced6875f9af533f63333b5bbefde6d5c8bc5565bc7ce4c"
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

  sha     = "h1:5olf7F1y+tIPVXQm3mL3gYMF3U9sEYXJ33BRzQERLIQ="
  retries = 0
}
