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

  sha = "b09975050eb07179ce32052fdc383178954acfbe00598f90cce1b23a40ef6753"
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

  sha = "h1:G+NJ+Qm58a5daJmxRKkQoZzHKcu7sQ9id4jSmQSFjzg="
}
