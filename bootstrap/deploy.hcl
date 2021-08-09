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

  sha = "517ba09834ce5572b55b7141e733ad3a5f5b617f323b2832ea8f2b3f551fa4f2"
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

  sha = "h1:BUJt0h72NLpTzhQoeA/fSD0J8ySp2xh8V5r3KkA63cA="
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

  sha = "h1:3blEe44F6RiH7aHmoIh0ZDvJirIRosItJ9dIRSVXTfc="
}
