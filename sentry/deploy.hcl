metadata {
  path = "sentry"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Aw0hsV+5y3ZGFZ4D5JXzaetTO7Wk7MYmje6TUpJbFAY="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Aw0hsV+5y3ZGFZ4D5JXzaetTO7Wk7MYmje6TUpJbFAY="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "sentry"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "sentry",
  ]

  sha     = "h1:Aw0hsV+5y3ZGFZ4D5JXzaetTO7Wk7MYmje6TUpJbFAY="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "sentry"
  target  = "sentry/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "98446eb2f270c98606c0d56d4e4a46aeaa8e9c750dfe57da613bc5a9f6ab3e6e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "sentry"
  target  = "sentry/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "sentry",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "sentry"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "sentry",
  ]

  sha     = "h1:wMZiRG+VQxLNpJfAkN/XSeqka3ETPy4+r5+wjvuKepM="
  retries = 2
  verbose = false
}
