metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha = "h1:eZGbPjdigQUyuYrZEqBLFti2v94WT6Ra+BenaC25v2k="
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "18e8128668908457567038df170ad635350e3b9eb44635581b67308044e272ad"
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha = "h1:K58dC3a4uKoc98YPgcUCmIk1x9AmL+g+vaBThWgPFCU="
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha = "h1:U+HSePad0p2C0OinvXtmkFDlVBOAseHzeNQH0q8/wSc="
}
