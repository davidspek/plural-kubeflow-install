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

  sha     = "f7658410e4194f79699fbe4ee4bf46841f2cc847fc76e4df396105b10c7e917e"
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
