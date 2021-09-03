metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:roeWiKvkch6j5Zq/xOv0QSo2wPxn9qSinLUfEAZONfc="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:roeWiKvkch6j5Zq/xOv0QSo2wPxn9qSinLUfEAZONfc="
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

  sha = "h1:roeWiKvkch6j5Zq/xOv0QSo2wPxn9qSinLUfEAZONfc="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "6ee4713ada2423261e145a8df214a3548fcc945d0ab592d14c95761fb4f42afb"
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

  sha = "h1:7FdY7EQzLud8Ibr90WeuMDc/WYeGqxdvj85wM+8PEBU="
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

  sha = "h1:jvn7f9vlVG8j6e7jz96/HqCfmYUEHYeH/8ZfEyniEDs="
}
