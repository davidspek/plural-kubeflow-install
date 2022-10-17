metadata {
  path = "kafka"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:aTIEuDmcrkYqdMq0UTbdM+rnm5LJQKMZaqwJP5yupKk="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:aTIEuDmcrkYqdMq0UTbdM+rnm5LJQKMZaqwJP5yupKk="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "kafka"
  target  = "kafka/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "kafka",
  ]

  sha     = "h1:aTIEuDmcrkYqdMq0UTbdM+rnm5LJQKMZaqwJP5yupKk="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kafka"
  target  = "kafka/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "95bede914702b8af2382cf71c23ba36e80a13fc0a05c19a3467c223736a96487"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kafka"
  target  = "kafka/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kafka",
  ]

  sha     = "h1:R5aMMRvui09Sy/V4GIuS0McmqqdahbO1k7U/XsD6Zng="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kafka"
  target  = "kafka/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kafka",
  ]

  sha     = "h1:FQ1J+2sfLiK4XPEzNU45pxl3nxv1DGW6h3xDydZAHrI="
  retries = 2
  verbose = false
}
