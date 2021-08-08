metadata {
  path = "istio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
}

step "terraform-apply" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
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

  sha = "h1:0j8rWcEJe23HDIqiGzTschlEZpIpFMgO6njs7iZZmN8="
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha = "8cf4bbf7c2edfc2419e2deed4d0fec1e99bcaecd1c8f088ac76aa5decbdbbea0"
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

  sha = "h1:uk6ylA6IFs05czBbNJJAxchdZsH+K8yK5O/xxjy8u5Y="
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

  sha = "h1:LzNb9RDXMF3P5OjwwSCT+1GOPqHkhwAab33/cW7/qYk="
}
