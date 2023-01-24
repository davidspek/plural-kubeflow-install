metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:F4u1mcs12/4EDMP44rK8mMKkpJjJunxv6D8PdCXxjsM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:F4u1mcs12/4EDMP44rK8mMKkpJjJunxv6D8PdCXxjsM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "cfae3ed4d75db69d153eceb7039173646d6ab1280074e878990ded441333c4ff"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:rjRxSfYpgvz/G48ZEEGDLLqunmiRFGhY3jGmtDnOLv0="
  retries = 0
  verbose = false
}
