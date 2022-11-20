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

  sha     = "aaf02cb822cf74e74e77597050158903d24b3cf7e58ef3e682ace72978ecb679"
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

  sha     = "h1:hrQK1wklZRl+qeCkbtwy1KFTOjgtNTkgTYLTJB7vgnM="
  retries = 0
  verbose = false
}
