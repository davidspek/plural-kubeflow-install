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

  sha     = "936f2174eca5253559a94de92a129afdfc1add2f61588e80bce8690a9814ed25"
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

  sha     = "h1:DwqXf+vVVp7K1KyleGMN514fujSfJ8T+OHHBOiyqry8="
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

  sha     = "h1:nDc8YEcCC/YqnenDVnzpSozaXeWZb/cOe6mZ+qBWhE0="
  retries = 2
  verbose = false
}
