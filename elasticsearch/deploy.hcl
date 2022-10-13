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

  sha     = "5401a825c09b2700748e2cbf5d4f9b54f822a4cf9938a0daafe668ed883625fe"
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

  sha     = "h1:AWj10D4WVpecD4E5p9gHva3M7tf3ozuOeD5QrYAg0Ns="
  retries = 2
  verbose = false
}
