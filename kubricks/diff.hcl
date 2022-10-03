metadata {
  path = "kubricks"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Hpov1YRkquYrsPilJ0quQcKS3Q7JcrY8T/KEyV8RzaM="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubricks",
  ]

  sha     = "h1:Hpov1YRkquYrsPilJ0quQcKS3Q7JcrY8T/KEyV8RzaM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "kubricks"
  target  = "kubricks/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubricks",
  ]

  sha     = "3ad39458873042960ad98e7cc806acdf76364c1202ba4058e021bc4b30b90727"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "kubricks/helm"
  target  = "kubricks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubricks",
  ]

  sha     = "h1:388n0x4m2cWPAMcFEntCsydCDDfcxRHg2exs6Hvmg4s="
  retries = 0
  verbose = false
}
