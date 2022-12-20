metadata {
  path = "posthog"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "posthog/terraform"
  target  = "posthog/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "posthog",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "posthog"
  target  = "posthog/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "posthog",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "posthog/helm"
  target  = "posthog/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "posthog",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
