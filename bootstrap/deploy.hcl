metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tCwlOmPQXoi7KmwW5116d1U68sdGuYgtJveGoDExmRY="
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:tCwlOmPQXoi7KmwW5116d1U68sdGuYgtJveGoDExmRY="
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

  sha = "h1:tCwlOmPQXoi7KmwW5116d1U68sdGuYgtJveGoDExmRY="
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "25b33473e8575ec94770c459118323948aed8390298c87b3e0d7f9574ae586bb"
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

  sha = "h1:u4lEja752VT49UmnanbKy+ohk6Tz+y9kQK/I+Aw0oIE="
}
