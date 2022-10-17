metadata {
  path = "elasticsearch"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:v4CdpcAvJ/gckLpvtpIiNINCmdS4BcouE7oUWAy1KM8="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:v4CdpcAvJ/gckLpvtpIiNINCmdS4BcouE7oUWAy1KM8="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "elasticsearch",
  ]

  sha     = "h1:v4CdpcAvJ/gckLpvtpIiNINCmdS4BcouE7oUWAy1KM8="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "d091dbdc772f2aa77815a284eba55058b992ac60fa425070329531d494c59c38"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "elasticsearch",
  ]

  sha     = "h1:U5z5YKcVvr9luLBJSn339fg4MlbqFJZwLxEajHVE90s="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "elasticsearch"
  target  = "elasticsearch/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "elasticsearch",
  ]

  sha     = "h1:cQ63j273/GCZIXSa54BNaNmuOk9bBqtszfG94OnrdJg="
  retries = 2
  verbose = false
}
