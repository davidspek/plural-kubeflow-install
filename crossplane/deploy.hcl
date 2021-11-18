metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:CC3d7aqSG7gmxCpW7Nl5j6Fk4sFEolJScbayMXRiCps="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:CC3d7aqSG7gmxCpW7Nl5j6Fk4sFEolJScbayMXRiCps="
  retries = 1
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "crossplane",
  ]

  sha     = "h1:CC3d7aqSG7gmxCpW7Nl5j6Fk4sFEolJScbayMXRiCps="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1a03c08d4125cc2ed3b2cbb18835c9829ce9463253f405d6facfe9b2684f8ddd"
  retries = 0
}

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha     = "h1:ZSCjhft99lNDm80BNhvAsKjp+BBAoRvonlkjmd7xPFg="
  retries = 0
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha     = "h1:zhPZVkTiSq6hYNtPkUHlNHXLh7akaw7XHwPkY0IxRuI="
  retries = 1
}
