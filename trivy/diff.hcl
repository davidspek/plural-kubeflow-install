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

  sha     = "h1:/5y2d+I4Oxdj3yCZjzVG34tw0HM8AYRyP8Bl+lw4Ki0="
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

  sha     = "h1:/5y2d+I4Oxdj3yCZjzVG34tw0HM8AYRyP8Bl+lw4Ki0="
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

  sha     = "78e6ef370d7aed8e442d028c2eced57e61921e43ccd9eef1b48557382335f749"
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

  sha     = "h1:rI+ejKB0ZXcAlpNRhDyXB2AVoEBu6orhy1dvMOSHjbI="
  retries = 0
  verbose = false
}
