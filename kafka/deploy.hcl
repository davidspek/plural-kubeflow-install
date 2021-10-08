metadata {
  path = "kafka"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:v5r2gkvHcwijeHmY0n7m4aNQTPOfZzecJG21KMedrjk="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kafka/terraform"
  target  = "kafka/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:v5r2gkvHcwijeHmY0n7m4aNQTPOfZzecJG21KMedrjk="
  retries = 1
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

  sha     = "h1:v5r2gkvHcwijeHmY0n7m4aNQTPOfZzecJG21KMedrjk="
  retries = 0
}

step "kube-init" {
  wkdir   = "kafka"
  target  = "kafka/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "09775ec2fbe6e5f7c1f05e0c97f9f8679c1a62297757e7840a212d3383b64bc6"
  retries = 0
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

  sha     = "h1:TXt0oiREnqB/ZZuXht+GEI9SDoiCO6QH0QS4IbmQE7s="
  retries = 0
}
