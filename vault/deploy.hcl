metadata {
  path = "vault"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:t+9WZqx7Afyx6xyHmPCSrxRLUlPtvX0EvohY/UbNWhI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "vault/terraform"
  target  = "vault/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:t+9WZqx7Afyx6xyHmPCSrxRLUlPtvX0EvohY/UbNWhI="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "vault"
  target  = "vault/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "ab4cf84685934e330d826da45c44fac17f3a3ac235e8cd8119a988db0310881e"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "vault"
  target  = "vault/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "vault",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "vault"
  target  = "vault/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "vault",
  ]

  sha     = "h1:os4trcWhzJMVvnN6OzWNgyfHIZoXyQiWIvivliUPQYM="
  retries = 1
  verbose = false
}
