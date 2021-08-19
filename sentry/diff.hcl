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

  sha = "883d3428125690b32f43e7623a5ded04db29b39eed208ca75a94046ff97df99f"
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

  sha = "h1:BkrZq3L8JLUHRvaBz8nJQLT9kuY/YgLysa9gwJJteCg="
}
