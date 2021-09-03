metadata {
  path = "console"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
}

step "terraform-apply" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
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

  sha = "h1:8GxTpFpq63F0IgxozTqEIeLIA4TuHGYqR6hfy+wmxB4="
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "8a3150be990e6d206dcc1d090db2c92d00709d97825c7f82a178917d83b8e769"
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

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
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

  sha = "h1:mx4jSOkc/Vo3Jc96K7Inj015Ha5yw7WuuXOCrg70fc0="
}
