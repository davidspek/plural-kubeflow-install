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

  sha     = "5ac703c9efbbc8daefff3c646d29d70f611b13783bc2f7a7c789155d9b3e3a0d"
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

  sha     = "h1:5FM5i2DR7TExopzhJCM+sVeSU5NHEHWzpXsKM+azPUs="
  retries = 1
}
