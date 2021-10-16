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

  sha     = "h1:PwxLrDGEB2uUHLCtYV9r3InmGOtEKFtcdpeYgQZAELE="
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

  sha     = "h1:PwxLrDGEB2uUHLCtYV9r3InmGOtEKFtcdpeYgQZAELE="
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

  sha     = "h1:PwxLrDGEB2uUHLCtYV9r3InmGOtEKFtcdpeYgQZAELE="
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

  sha     = "d4e222bfb54d8d54f3aa300a656c83ed5052a1ae26cb47564fc030f05ebaa7df"
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

  sha     = "h1:l/xwj5GlLxNQaimVRQ6W/SvZ1VOEa01/m8YbggRQRoI="
  retries = 1
}
