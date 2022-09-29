metadata {
  path = "kubricks"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Hpov1YRkquYrsPilJ0quQcKS3Q7JcrY8T/KEyV8RzaM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "kubricks/terraform"
  target  = "kubricks/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Hpov1YRkquYrsPilJ0quQcKS3Q7JcrY8T/KEyV8RzaM="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "kubricks"
  target  = "kubricks/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "2d4a0c7c5e70854630d44bf2afbaa1521ab2ec37454b75ff1f0be2d6be7e5e2a"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "kubricks"
  target  = "kubricks/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubricks",
  ]

  sha     = "h1:NFae7mj2oq0KAfAccJxVMh7kqCfj1Ieb/ITHC31Q0aI="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "kubricks"
  target  = "kubricks/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubricks",
  ]

  sha     = "h1:388n0x4m2cWPAMcFEntCsydCDDfcxRHg2exs6Hvmg4s="
  retries = 2
  verbose = false
}
