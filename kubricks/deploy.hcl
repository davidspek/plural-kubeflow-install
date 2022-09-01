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

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
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

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
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

  sha     = "h1:8EKpl9qDLBn5JsW+vvaVIiThHU306e/8sFL0qTFGEYA="
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

  sha     = "fba4c4358ce6212381655fefc78035058c7d1b12ed33c56a19ec3fbfcc3e7cfc"
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
