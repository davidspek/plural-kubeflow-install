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

  sha     = "cfb7f449141d1a80eb218793aad9e3b9f9fff30b0e09f60d60e41562a0bd0f57"
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

  sha     = "h1:DDwjSaQWUunIGiVpQw4DZRby6gLZLoQ6oiJCVoCk1lA="
  retries = 0
}
