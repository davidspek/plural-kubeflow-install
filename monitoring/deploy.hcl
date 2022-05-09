metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:w1b25G/DxYyNQUCWY2aPkF0leY7RoWhJ608XPqBxUTo="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:w1b25G/DxYyNQUCWY2aPkF0leY7RoWhJ608XPqBxUTo="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:w1b25G/DxYyNQUCWY2aPkF0leY7RoWhJ608XPqBxUTo="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "142bfb41b6be37bf4e3c9086260ef3377ad4fbbb185bbca53773c1e3e66e9ccb"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:E82vY6TK15PNCfsRyWSRy/BN+rYx2ZI+dK0AmWQb47M="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:OXM6MEImjhoPyfkSwQFr7o/ZIECztlgo11KtJja7t9o="
  retries = 1
  verbose = false
}
