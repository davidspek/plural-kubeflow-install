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

  sha     = "ab4cf84685934e330d826da45c44fac17f3a3ac235e8cd8119a988db0310881e"
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

  sha     = "h1:os4trcWhzJMVvnN6OzWNgyfHIZoXyQiWIvivliUPQYM="
  retries = 0
  verbose = false
}
