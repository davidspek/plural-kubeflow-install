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

  sha     = "6eb505c8162e24f46a00bb61a7af161244b5e42732a7f20b2c1bbc8d25981ac1"
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
