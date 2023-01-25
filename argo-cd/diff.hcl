metadata {
  path = "argo-cd"
  name = "diff"
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

step "terraform" {
  wkdir   = "argo-cd/terraform"
  target  = "argo-cd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "argo-cd",
  ]

  sha     = "e4409d60433fb1a436b8b6e17846b518bda324e7d8d62747af4f7129974f5b27"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "argo-cd/helm"
  target  = "argo-cd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "argo-cd",
  ]

  sha     = "h1:BMelr2p0okXL8G9UUwULyYpnE7zd91c82ZGo10I5BlI="
  retries = 0
  verbose = false
}
