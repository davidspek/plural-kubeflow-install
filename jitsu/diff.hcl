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

  sha     = "4cfd4dbc00789731e15f413b38b8343a6dbfb398ae4b8ef54da560965461268e"
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

  sha     = "h1:bifcOnksae7sfShDU+9+fEro4/4r7p+Tngb0Qec7mbk="
  retries = 0
  verbose = false
}
