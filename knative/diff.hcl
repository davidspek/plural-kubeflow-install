metadata {
  path = "knative"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:M4vi+qex1p3Zub7gGY/howM6VuQ85e8XbPPa9MfdckM="
  retries = 0
}

step "terraform" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "knative",
  ]

  sha     = "h1:M4vi+qex1p3Zub7gGY/howM6VuQ85e8XbPPa9MfdckM="
  retries = 0
}

step "kube-init" {
  wkdir   = "knative"
  target  = "knative/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "knative",
  ]

  sha     = "7d2cea195418c89a5926ab149b87baebf183bdb95e8927eabae4f3bddade5563"
  retries = 0
}

step "helm" {
  wkdir   = "knative/helm"
  target  = "knative/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "knative",
  ]

  sha     = "h1:J/U68tKCZ0IwJ3iFyXy7Y/d/PHIpbsXPMQT/dT6pm/I="
  retries = 0
}
