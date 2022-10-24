metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:SCHd3JQO6uZ2bQ2LNLwEkkAyHhbMbRT8Tzso4viGMsg="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:SCHd3JQO6uZ2bQ2LNLwEkkAyHhbMbRT8Tzso4viGMsg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha     = "4c8bb478c8d5c949b57b4e7b0c575f9d25548e7da6530857dc159ff8847def73"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:gFQVNk3NhUOriJIkMhEd2UteyVK301q7r9jLl9FWXN8="
  retries = 0
  verbose = false
}
