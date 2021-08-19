metadata {
  path = "sentry"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "terraform" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "sentry",
  ]

  sha = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "kube-init" {
  wkdir   = "sentry"
  target  = "sentry/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "sentry",
  ]

  sha = "70849f211ffe930e0af9fd572dd15c90bd476b2690b9a0382949f3d5fc14a894"
}

step "helm" {
  wkdir   = "sentry/helm"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "sentry",
  ]

  sha = "h1:k7UyeX8cMZUb9+Nsip3Bi8SC0y56lTWrsfNkGWXvnvM="
}
