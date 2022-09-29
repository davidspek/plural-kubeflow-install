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

  sha     = "h1:or94BCde9YdVt82yzfVPgSJVcn3tHCvUAk98QFlXwD8="
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

  sha     = "h1:or94BCde9YdVt82yzfVPgSJVcn3tHCvUAk98QFlXwD8="
  retries = 2
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

  sha     = "h1:or94BCde9YdVt82yzfVPgSJVcn3tHCvUAk98QFlXwD8="
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

  sha     = "ca5ce455072a162298c983650ab39a2fdc2ff4daa8f7cdc770e459724e66d51e"
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

  sha     = "h1:vzHMj2WSslGQ5wseAQlkuROXyl6mVarcXEfpqjPeqEY="
  retries = 2
  verbose = false
}
