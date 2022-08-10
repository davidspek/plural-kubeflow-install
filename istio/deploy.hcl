metadata {
  path = "istio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "istio"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "istio",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "eb47705130c151d5b07169238d7f8a80a557d06cc29199084605da0c4fea6c3b"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "istio"
  target  = "istio/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "istio",
  ]

  sha     = "h1:uk6ylA6IFs05czBbNJJAxchdZsH+K8yK5O/xxjy8u5Y="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "istio"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "istio",
  ]

  sha     = "h1:leTyFQu+MgqF5+TbeilAjhr8uQBknxiQulBoVcHC/9o="
  retries = 1
  verbose = false
}
