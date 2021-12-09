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

  sha     = "36a5a1d4847c42c3fd8479aea04a1e932039836319b917f6f5e279d574e54bdf"
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

  sha     = "h1:aFrAr1OovER6pSS1MnCO2KRFgjWjYVw0svbFilHCp7k="
  retries = 1
}
