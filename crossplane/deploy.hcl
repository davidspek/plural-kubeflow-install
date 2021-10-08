metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:My0rXvdX/gYPobHKFGRgWt8sZzD5GrwQ4KtBwaXn7UA="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:My0rXvdX/gYPobHKFGRgWt8sZzD5GrwQ4KtBwaXn7UA="
  retries = 1
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "crossplane",
  ]

  sha     = "h1:My0rXvdX/gYPobHKFGRgWt8sZzD5GrwQ4KtBwaXn7UA="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "dcabaca7456910afe7a9547cd0607a56690f41ff8628c7bbf7a5047c7825950d"
  retries = 0
}

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha     = "h1:ZSCjhft99lNDm80BNhvAsKjp+BBAoRvonlkjmd7xPFg="
  retries = 0
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha     = "h1:jyesztvMqv8Gjo2PpnhGu+MBkGtXdDO4hlkCQw7NqiY="
  retries = 0
}
