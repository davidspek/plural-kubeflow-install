metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:JXDK4X/MlshYjnbpp5ceKVHXsiJmjkq1Y9BvvOp1kGI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:JXDK4X/MlshYjnbpp5ceKVHXsiJmjkq1Y9BvvOp1kGI="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:JXDK4X/MlshYjnbpp5ceKVHXsiJmjkq1Y9BvvOp1kGI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "b7b8bf0054e617605d08ab00d1cf9e2e47af43e857c9ef3150a64a8a624c983e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:P7ekLF8KA9rIGP2QMQltfdv906hI/kRehQBSSPa161U="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:bAeoZlrzL7ZwswRKktQI5BjxrVaTujH+pnitjV8ft4w="
  retries = 1
  verbose = false
}
