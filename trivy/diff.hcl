metadata {
  path = "trivy"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "trivy/terraform"
  target  = "trivy/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "trivy/terraform"
  target  = "trivy/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "trivy",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "trivy"
  target  = "trivy/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "trivy",
  ]

  sha     = ""
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "trivy/helm"
  target  = "trivy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "trivy",
  ]

  sha     = ""
  retries = 0
  verbose = false
}
