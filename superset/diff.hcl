metadata {
  path = "superset"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:EFUYOuoQFApaZovMWYzrxOUQCUZZZdoRdky24Kgyp1U="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "superset/terraform"
  target  = "superset/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "superset",
  ]

  sha     = "1129c6953b91f7c8403e5095b6932ed9a39d92145886b5182609880b2949be33"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "superset/helm"
  target  = "superset/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "superset",
  ]

  sha     = "h1:4VNcmDY9nm51nCb0cxt7FjlFSvZzF+DDtM5SyYKOKRM="
  retries = 0
  verbose = false
}
