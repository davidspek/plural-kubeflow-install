metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Ny2qu1v83wjmrE1nc35DF+6NG1t6N3z3uGb//LbPqlY="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "monitoring",
  ]

  sha     = "235f7c4f94ddcf7562c933443843603a75250f396704ee3756edb775b35a42cc"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:cfveC4WYnYUWy0y9fY+T4LS50HLGBs7jKVE5KrBc7j0="
  retries = 0
  verbose = false
}
