metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:CC3d7aqSG7gmxCpW7Nl5j6Fk4sFEolJScbayMXRiCps="
  retries = 0
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "crossplane",
  ]

  sha     = "015594acbea89c1c07cfbdf61e3a8bde296b5fa5cac34c414859cf046424d15e"
  retries = 0
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha     = "h1:G/K+vicnsAhvlN2inS9wTvspqewO2IFKNJA/1n4QZCk="
  retries = 0
}
