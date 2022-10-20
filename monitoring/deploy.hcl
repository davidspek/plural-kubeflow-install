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

  sha     = "795dabb4d4abb77f15f2b9e2e601f647b6e1d85b6a1b631fa3d8ec178bb7d384"
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

  sha     = "h1:TaEW/SKrIw3jbk8BEHUfYtGYL10t+nH0wsUMw/0cxuA="
  retries = 2
  verbose = false
}
