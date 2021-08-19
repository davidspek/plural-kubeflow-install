metadata {
  path = "sentry"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "terraform-apply" {
  wkdir   = "sentry/terraform"
  target  = "sentry/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha = "h1:eF4JNuujFGE/2IXI8sYSz/oaZV2cG3mvmrLpUF5VIis="
}

step "terraform-output" {
  wkdir   = "sentry"
  target  = "sentry/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha = "883d3428125690b32f43e7623a5ded04db29b39eed208ca75a94046ff97df99f"
}

step "crds" {
  wkdir   = "sentry"
  target  = "sentry/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "sentry",
  ]

  sha = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
}

step "bounce" {
  wkdir   = "sentry"
  target  = "sentry/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "sentry",
  ]

  sha = "h1:BkrZq3L8JLUHRvaBz8nJQLT9kuY/YgLysa9gwJJteCg="
}
