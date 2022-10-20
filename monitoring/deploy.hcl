metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Ny2qu1v83wjmrE1nc35DF+6NG1t6N3z3uGb//LbPqlY="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Ny2qu1v83wjmrE1nc35DF+6NG1t6N3z3uGb//LbPqlY="
  retries = 2
  verbose = false
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

  sha     = "h1:Ny2qu1v83wjmrE1nc35DF+6NG1t6N3z3uGb//LbPqlY="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "235f7c4f94ddcf7562c933443843603a75250f396704ee3756edb775b35a42cc"
  retries = 0
  verbose = false
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

  sha     = "h1:e+ixjmqTzrNusP8edlvhAOnAqpN2K0f7iCWL2eDeCKM="
  retries = 0
  verbose = false
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

  sha     = "h1:cfveC4WYnYUWy0y9fY+T4LS50HLGBs7jKVE5KrBc7j0="
  retries = 2
  verbose = false
}
