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

  sha     = "06f2f7891707cd67ac1a740626294f2be0a52bd187b622e6c39dbb73c96ab3fe"
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

  sha     = "h1:NID9IOPOlMCguZosa5Nql4aJJHhCtOcAmfoh7/u/a8g="
  retries = 0
}
