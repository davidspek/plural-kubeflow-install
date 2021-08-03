metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
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

  sha = "h1:tEyH+06ThHcQ87c8B5MaBcOwE2M96MBa3e9c4iPelQU="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "0d1db493f96dc18f72291b1a1998bffa4164034f47c931fa924abaa8b8977d30"
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

  sha = "h1:2N/91vLdoqf+BuROXb2HJ7HIKH/lkoqIn6vT3f2/a2Q="
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

  sha = "h1:Fj+0+Tx/UEKebZ5iFXjQ5SOedXrua3BEMrF7BdbF5+c="
}
