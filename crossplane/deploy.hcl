metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:hEGp/MblTNve9EAwqdcWwdphkcagnNwNqWla9Pvwx1E="
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

  sha     = "h1:hEGp/MblTNve9EAwqdcWwdphkcagnNwNqWla9Pvwx1E="
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

  sha     = "h1:hEGp/MblTNve9EAwqdcWwdphkcagnNwNqWla9Pvwx1E="
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

  sha     = "e6ef5ff1d0f87bbcfedf672a7c06a05f24f310f0af77c1bb538711b9c2278645"
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

  sha     = "h1:CU0hEbDPeNZ/2yYbzx5DY3hegKDYiNW1nlhpsiNQT3E="
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

  sha     = "h1:SresmnzWF73bqNpwTKHdMJo/MO7nnswLhpqLFr7bo8M="
  retries = 1
}
