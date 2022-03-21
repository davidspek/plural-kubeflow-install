metadata {
  path = "istio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 0
}

step "terraform" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "istio",
  ]

  sha     = "h1:qOborOHnp8RqlPPTk/6Zrvnhb10ayVcYHPw50lyh4Dg="
  retries = 0
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "istio",
  ]

  sha     = "868bfd885aa0b0f5810ddfaa40009e3f239b09225b70bd7d8800de0f0ef05c22"
  retries = 0
}

step "helm" {
  wkdir   = "istio/helm"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "istio",
  ]

  sha     = "h1:CUAQG+Mi+mYgInNsgSV33TzRRsWRtQFqXcG6mQNXg70="
  retries = 0
}
