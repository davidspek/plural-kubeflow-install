metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:33GE2OoJ4bEdcbEPq99XsKq+cJlPdTokXxWbs7HCKBs="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:33GE2OoJ4bEdcbEPq99XsKq+cJlPdTokXxWbs7HCKBs="
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

  sha = "h1:33GE2OoJ4bEdcbEPq99XsKq+cJlPdTokXxWbs7HCKBs="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "1acd697e94eb4f037aeb5b7f5015326fd5acc5dcf848f7f8c8675b0bdcf56c34"
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
