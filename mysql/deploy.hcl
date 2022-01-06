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

  sha     = "f87960cfb763cd3e7836ced86f134f1494386ce902bf39bd00fbc9b908e5b666"
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

  sha     = "h1:SABD0DqV54pcSlwwlCLD1WqYz4Gt1BWM+7PXVJ+xD1Q="
  retries = 1
}
