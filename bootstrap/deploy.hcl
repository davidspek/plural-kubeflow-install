metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Wy/NACN5aRjQtMY1ZeaLdXLHp2A3xnT667M2wTvbLzc="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:Wy/NACN5aRjQtMY1ZeaLdXLHp2A3xnT667M2wTvbLzc="
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

  sha = "h1:Wy/NACN5aRjQtMY1ZeaLdXLHp2A3xnT667M2wTvbLzc="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "703eec399fe6ed769c5e7b6b3d7ee7791f537316467ddcc27a4ca6fd05fd04c7"
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

  sha = "h1:k3zxd1NPd1rNmvuXz14jXrUsbIWIduGIR1um+YodA54="
}
