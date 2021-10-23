metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:iN0nHFvJfkOOnSMlMneUiLwbiK60fgxpD8+n35AMMH4="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:iN0nHFvJfkOOnSMlMneUiLwbiK60fgxpD8+n35AMMH4="
  retries = 1
}

step "terraform-output" {
  wkdir   = "console"
  target  = "console/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "console",
  ]

  sha     = "h1:iN0nHFvJfkOOnSMlMneUiLwbiK60fgxpD8+n35AMMH4="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ee44516ca72497b4d4f1baa15926200a3ee523d216fb286874441db3db4c4f70"
  retries = 0
}

step "crds" {
  wkdir   = "console"
  target  = "console/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "console",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "console"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "console",
  ]

  sha     = "h1:kU161o+xfzz0QuQev8p4Lptf7zX+NJD68almY0JFOGc="
  retries = 1
}
