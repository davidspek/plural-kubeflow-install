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

  sha     = "3a4dd2d2055c355918c27d3ff2b24eff05d51af477464a6e092b7c7fc0b270ee"
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

  sha     = "h1:8qDWGdi3CU/rsC5UzSogfkRLINt3WFgjyeBoYGMs/Pk="
  retries = 1
}
