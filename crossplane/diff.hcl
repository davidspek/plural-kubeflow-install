metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:hEGp/MblTNve9EAwqdcWwdphkcagnNwNqWla9Pvwx1E="
  retries = 0
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "crossplane",
  ]

  sha     = "3a4dd2d2055c355918c27d3ff2b24eff05d51af477464a6e092b7c7fc0b270ee"
  retries = 0
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha     = "h1:8qDWGdi3CU/rsC5UzSogfkRLINt3WFgjyeBoYGMs/Pk="
  retries = 0
}
