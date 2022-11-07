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

  sha     = "3e87dfae028465c45dd1d9a20558a5851e46afa8bf88ffb44eec2ec746736e64"
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
