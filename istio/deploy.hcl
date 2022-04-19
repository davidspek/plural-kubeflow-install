metadata {
  path = "istio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 1
}

step "terraform-output" {
  wkdir   = "istio"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "istio",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 0
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9c61b2b3ebce46ecebaf08b301cf4600e8cd47835a506c4059250ef770762748"
  retries = 0
}

step "crds" {
  wkdir   = "istio"
  target  = "istio/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "istio",
  ]

  sha     = "h1:uk6ylA6IFs05czBbNJJAxchdZsH+K8yK5O/xxjy8u5Y="
  retries = 0
}

step "bounce" {
  wkdir   = "istio"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "istio",
  ]

  sha     = "h1:EDEBpoSgf26jhIQ+x3delUj6Rd04WVNHt3FdCG/q0Q8="
  retries = 1
}
