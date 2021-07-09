metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:3P9X64maMmAm+jYPAXyyG9wMvhlK/dysC8U5STv4K1s="
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:3P9X64maMmAm+jYPAXyyG9wMvhlK/dysC8U5STv4K1s="
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

  sha = "h1:3P9X64maMmAm+jYPAXyyG9wMvhlK/dysC8U5STv4K1s="
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "mysql",
  ]

  sha = "54cefa297c7d464d328876263ddf5e7a7eb68a84d2574fde046ed6207b12b02e"
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

  sha = "h1:044S1+ptG9zyrB8p0LDMQZMd1vTbGQUBUKL3EGBPN5A="
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

  sha = "h1:pMFCKhol2Gf65ZFEUYr/IeJR8Pl4Yg2b8KTvFVsTHiM="
}
