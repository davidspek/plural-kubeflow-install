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

  sha     = "5fcc6e74a7bce1210b008876f9124b54ab1373cdd794bc3469c42ed27e71c7d4"
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

  sha     = "h1:9bO1UNmI52KnNUbELaDc01KVilTGyfPaGYZ3uFk/RdY="
  retries = 0
  verbose = false
}
