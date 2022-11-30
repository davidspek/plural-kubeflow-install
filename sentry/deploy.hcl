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

  sha     = "8a1f4c809bb8ff6c384af4769fb15a91b37f88c442ee74484bcdece152ee8c19"
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

  sha     = "h1:viF+CdZv3XxndDrkF3jgEB8kHvfa/guKgyqwyZ56anA="
  retries = 2
  verbose = false
}
