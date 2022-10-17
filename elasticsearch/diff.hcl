metadata {
  path = "elasticsearch"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:v4CdpcAvJ/gckLpvtpIiNINCmdS4BcouE7oUWAy1KM8="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "elasticsearch/terraform"
  target  = "elasticsearch/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "elasticsearch",
  ]

  sha     = "d091dbdc772f2aa77815a284eba55058b992ac60fa425070329531d494c59c38"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "elasticsearch/helm"
  target  = "elasticsearch/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "elasticsearch",
  ]

  sha     = "h1:cQ63j273/GCZIXSa54BNaNmuOk9bBqtszfG94OnrdJg="
  retries = 0
  verbose = false
}
