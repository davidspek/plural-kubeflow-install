metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:lOX78fTnnMZLn7AVqDNugOEY0dEsb7DaxvNE3ysA6NM="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:lOX78fTnnMZLn7AVqDNugOEY0dEsb7DaxvNE3ysA6NM="
  retries = 1
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

  sha     = "h1:lOX78fTnnMZLn7AVqDNugOEY0dEsb7DaxvNE3ysA6NM="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "5273bfadc4b14e6b5f60787da4113f9485ff63ba432a0d4d4d8a5662e1d3794c"
  retries = 0
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

  sha     = "h1:1Oqe3g0YZv5SLIywmh0YQI5fg+dMHd/0FzV176xzfa4="
  retries = 0
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

  sha     = "h1:yyUdTKFIy2Tbcr8qcsFRoyYr084FcV/OBZ0vOLYoleI="
  retries = 1
}
