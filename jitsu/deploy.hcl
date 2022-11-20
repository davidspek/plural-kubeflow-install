metadata {
  path = "jitsu"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "jitsu/terraform"
  target  = "jitsu/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ogIqh6ILfwB31YhX8d0qgkdEQslVimxsKcy2bMF7Aqs="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "jitsu"
  target  = "jitsu/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "4cfd4dbc00789731e15f413b38b8343a6dbfb398ae4b8ef54da560965461268e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "jitsu"
  target  = "jitsu/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "jitsu",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "jitsu"
  target  = "jitsu/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "jitsu",
  ]

  sha     = "h1:bifcOnksae7sfShDU+9+fEro4/4r7p+Tngb0Qec7mbk="
  retries = 2
  verbose = false
}
