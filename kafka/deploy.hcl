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

  sha     = "1bca604cb1f8ff5a6802f578856652614b3d35388577c618c72ef7e05e4eff5b"
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

  sha     = "h1:VkgM+V1gIx7qvEEZRrS6fvh5mOKwbxt/yCmoegHY/aM="
  retries = 2
  verbose = false
}
