metadata {
  path = "trivy"
  name = "deploy"
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

step "terraform-apply" {
  wkdir   = "trivy/terraform"
  target  = "trivy/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:/5y2d+I4Oxdj3yCZjzVG34tw0HM8AYRyP8Bl+lw4Ki0="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "trivy"
  target  = "trivy/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "a7e56347f308bc35969793be8fb72ef567e07e3d4fe0b0c15ddc0964d4447b6c"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "trivy"
  target  = "trivy/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "trivy",
  ]

  sha     = "h1:zYPZckyEvNmCD9wKMiLNpDD2vejFob7ZD0S2MGpGiSI="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "trivy"
  target  = "trivy/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "trivy",
  ]

  sha     = "h1:6JD10iRlt3hdqrBpsTz7R5zRyutDwtceqTIO9cYlw6s="
  retries = 2
  verbose = false
}
