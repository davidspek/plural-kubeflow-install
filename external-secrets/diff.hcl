metadata {
  path = "external-secrets"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "external-secrets/terraform"
  target  = "external-secrets/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tc8PV+YS3TT6X9DVYnov6HnM8E/VQgNJ0rQV5wfv/B0="
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

  sha     = "h1:tc8PV+YS3TT6X9DVYnov6HnM8E/VQgNJ0rQV5wfv/B0="
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

  sha     = "d0781af8ff6107491759ae14007b4207699a7cf8fb6112cfe39cc2bfc2381f90"
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

  sha     = "h1:eLKLVExfO3QiMLYSfPa+GfMutH6DvCfI8OsAKFKVPk8="
  retries = 0
  verbose = false
}
