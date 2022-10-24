metadata {
  path = "superset"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:EFUYOuoQFApaZovMWYzrxOUQCUZZZdoRdky24Kgyp1U="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:EFUYOuoQFApaZovMWYzrxOUQCUZZZdoRdky24Kgyp1U="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "superset"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "superset",
  ]

  sha     = "h1:EFUYOuoQFApaZovMWYzrxOUQCUZZZdoRdky24Kgyp1U="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "superset"
  target  = "superset/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1129c6953b91f7c8403e5095b6932ed9a39d92145886b5182609880b2949be33"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "superset"
  target  = "superset/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "superset",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "superset"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "superset",
  ]

  sha     = "h1:4VNcmDY9nm51nCb0cxt7FjlFSvZzF+DDtM5SyYKOKRM="
  retries = 2
  verbose = false
}
