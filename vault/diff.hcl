metadata {
  path = "vault"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:t+9WZqx7Afyx6xyHmPCSrxRLUlPtvX0EvohY/UbNWhI="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "vault",
  ]

  sha     = "h1:t+9WZqx7Afyx6xyHmPCSrxRLUlPtvX0EvohY/UbNWhI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "vault"
  target  = "vault/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "vault",
  ]

  sha     = "2ac0efd2f85ef5f995712acbdba8652dbdb5e31ec08ec81ec268774b904819e6"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "vault/helm"
  target  = "vault/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "vault",
  ]

  sha     = "h1:kqmav1qAWsWaXSkt0aer1sUUnkrOtZqr37gs4APIvt4="
  retries = 0
  verbose = false
}
