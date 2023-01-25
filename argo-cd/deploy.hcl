metadata {
  path = "argo-cd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:b28WFi8ifiez0G5IBH4OPmWP4ZAKW3kONLSwUXFRi6k="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:b28WFi8ifiez0G5IBH4OPmWP4ZAKW3kONLSwUXFRi6k="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "argo-cd"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "argo-cd",
  ]

  sha     = "h1:b28WFi8ifiez0G5IBH4OPmWP4ZAKW3kONLSwUXFRi6k="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "argo-cd"
  target  = "argo-cd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e4409d60433fb1a436b8b6e17846b518bda324e7d8d62747af4f7129974f5b27"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "argo-cd"
  target  = "argo-cd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "argo-cd",
  ]

  sha     = "h1:va6snQaY+PXdygN7PnzCcpnVFft//7z9hJcC/iPBb74="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "argo-cd"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "argo-cd",
  ]

  sha     = "h1:BMelr2p0okXL8G9UUwULyYpnE7zd91c82ZGo10I5BlI="
  retries = 2
  verbose = false
}
