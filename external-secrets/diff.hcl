metadata {
  path = "external-secrets"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "external-secrets",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "external-secrets"
  target  = "external-secrets/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "external-secrets",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "external-secrets/helm"
  target  = "external-secrets/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "external-secrets",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
