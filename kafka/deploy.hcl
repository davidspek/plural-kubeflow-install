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

  sha     = "541a19eed008e49054aac790f30cdf12be6baa231ff0d9947023bc71dade82cb"
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

  sha     = "h1:xJVwSYc3EmnKpamKXRvuDt6HkpIJ8x9O8zte4FGtbjU="
  retries = 2
  verbose = false
}
