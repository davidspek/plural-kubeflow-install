metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:RrVyfoWvga1w8YQl+0uh42ypCHbiX1J0vArWBOVCp+Y="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:RrVyfoWvga1w8YQl+0uh42ypCHbiX1J0vArWBOVCp+Y="
  retries = 1
}

step "terraform-output" {
  wkdir   = "mysql"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "mysql",
  ]

  sha     = "h1:RrVyfoWvga1w8YQl+0uh42ypCHbiX1J0vArWBOVCp+Y="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "0c78b395c8882d8ee9475c0a0779735424c8a1286256d8e8e698ada17e7623ca"
  retries = 0
}

step "crds" {
  wkdir   = "mysql"
  target  = "mysql/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mysql",
  ]

  sha     = "h1:uNJ+QzJsx9nBbinejxqtfpphNDus5Iv4NgnqVvJYKi4="
  retries = 0
}

step "bounce" {
  wkdir   = "mysql"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mysql",
  ]

  sha     = "h1:+aPo3ejcn1bSpcZCwCh7Tt0z0kYYcPrnHKnPUFxOShw="
  retries = 1
}
