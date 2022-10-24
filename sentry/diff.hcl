metadata {
  path = "sentry"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Aw0hsV+5y3ZGFZ4D5JXzaetTO7Wk7MYmje6TUpJbFAY="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "sentry",
  ]

  sha     = "56b4ab05e75c22992b2fb3efb827e26852c04af0b3384a34f148bea316903fa6"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "sentry/helm"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "sentry",
  ]

  sha     = "h1:u2fWuk2ZhulW/XEz+ThFYCY8k92VZgEVatmL+/Z5Cdc="
  retries = 0
  verbose = false
}
