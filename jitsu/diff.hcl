metadata {
  path = "jitsu"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "jitsu",
  ]

  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "jitsu"
  target  = "jitsu/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "jitsu",
  ]

  sha     = "426d260ca8f66a074b08abfc7d89f9292d90a77c0a718aeeb0339157b486a9b2"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "jitsu/helm"
  target  = "jitsu/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "jitsu",
  ]

  sha     = "h1:YwJDfxGDl+ftfE1STBCaMEkHGfr33mTzCcPiJlV2ePI="
  retries = 0
  verbose = false
}
