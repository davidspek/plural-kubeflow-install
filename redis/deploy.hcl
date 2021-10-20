metadata {
  path = "redis"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:PHC5qcQ1XJJSzPouwm4n2ngED4WItGzitZS4XRPi3c4="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:PHC5qcQ1XJJSzPouwm4n2ngED4WItGzitZS4XRPi3c4="
  retries = 1
}

step "terraform-output" {
  wkdir   = "redis"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "redis",
  ]

  sha     = "h1:PHC5qcQ1XJJSzPouwm4n2ngED4WItGzitZS4XRPi3c4="
  retries = 0
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7a5e40f484bffae2f8acd216778e3e99df6794ab690d4ddbb4a1bb919e9f5e0a"
  retries = 0
}

step "crds" {
  wkdir   = "redis"
  target  = "redis/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "redis",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "redis"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "redis",
  ]

  sha     = "h1:8oXKYamBrp++7vJJEmSzjR+6nvYFyPZ93nWt9q5+1Eo="
  retries = 1
}
