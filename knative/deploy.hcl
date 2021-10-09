metadata {
  path = "knative"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:M4vi+qex1p3Zub7gGY/howM6VuQ85e8XbPPa9MfdckM="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "knative/terraform"
  target  = "knative/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:M4vi+qex1p3Zub7gGY/howM6VuQ85e8XbPPa9MfdckM="
  retries = 1
}

step "terraform-output" {
  wkdir   = "knative"
  target  = "knative/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "be16a328dcf336417bc84138f4040b820c7f00c3bbf8676d01cd54b5ea997f6c"
  retries = 0
}

step "crds" {
  wkdir   = "knative"
  target  = "knative/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "knative",
  ]

  sha     = "h1:or38XWULSBe79YhL1TAgy+gr5mxJyPfJh4r1Wv5/lsg="
  retries = 0
}

step "bounce" {
  wkdir   = "knative"
  target  = "knative/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "knative",
  ]

  sha     = "h1:J/U68tKCZ0IwJ3iFyXy7Y/d/PHIpbsXPMQT/dT6pm/I="
  retries = 1
}
