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

  sha     = "dc056b979bb857641ff0477358de09351ead05e37b64bcf06408010726f676c9"
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

  sha     = "h1:9bO1UNmI52KnNUbELaDc01KVilTGyfPaGYZ3uFk/RdY="
  retries = 2
  verbose = false
}
