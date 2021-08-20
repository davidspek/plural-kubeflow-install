metadata {
  path = "bootstrap"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:tCwlOmPQXoi7KmwW5116d1U68sdGuYgtJveGoDExmRY="
}

step "terraform" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "bootstrap",
  ]

  sha = "25b33473e8575ec94770c459118323948aed8390298c87b3e0d7f9574ae586bb"
}

step "helm" {
  wkdir   = "bootstrap/helm"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "bootstrap",
  ]

  sha = "h1:u4lEja752VT49UmnanbKy+ohk6Tz+y9kQK/I+Aw0oIE="
}
