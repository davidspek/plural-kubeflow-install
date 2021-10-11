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

  sha     = "h1:aOqzsN6tWoHApZmWO1c3SRLoZ1qWzV3M17U1w+tc9H4="
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

  sha     = "h1:aOqzsN6tWoHApZmWO1c3SRLoZ1qWzV3M17U1w+tc9H4="
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

  sha     = "h1:aOqzsN6tWoHApZmWO1c3SRLoZ1qWzV3M17U1w+tc9H4="
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

  sha     = "d1fc3338987ebb5e642ec353770ef0eaa73a9ad783082fa28a486e7bf28a1cff"
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

  sha     = "h1:977vyGboAu6XV1gxlKGBGGpXP37Fwd8HVEXaTLmiaj8="
  retries = 1
}
