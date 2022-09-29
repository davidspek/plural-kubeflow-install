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

  sha     = "h1:dU6XS15PbGTlYmi/sUUPh7kjyDZDvCFiVifAqkyakpA="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:dU6XS15PbGTlYmi/sUUPh7kjyDZDvCFiVifAqkyakpA="
  retries = 2
  verbose = false
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

  sha     = "h1:dU6XS15PbGTlYmi/sUUPh7kjyDZDvCFiVifAqkyakpA="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "7bacd8837dc12fb97625dbc55140b0cc17430da58c1ca54f2a94a4665579d3e8"
  retries = 0
  verbose = false
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
  verbose = false
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

  sha     = "h1:9oQpAhMPycmJRTic/mA/B4eLfXSM0jYct4HpTEmDZLI="
  retries = 2
  verbose = false
}
