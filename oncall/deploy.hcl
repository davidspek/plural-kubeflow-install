metadata {
  path = "oncall"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:e0q6Ii6vx9kXmf+P6W++hiYaDApkhkz8BrWzJBTYl8k="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:e0q6Ii6vx9kXmf+P6W++hiYaDApkhkz8BrWzJBTYl8k="
  retries = 2
  verbose = false
}

step "terraform-output" {
  wkdir   = "oncall"
  target  = "oncall/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "oncall",
  ]

  sha     = "h1:e0q6Ii6vx9kXmf+P6W++hiYaDApkhkz8BrWzJBTYl8k="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "oncall"
  target  = "oncall/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "68b850ede229da2b2404415c77e5129f8372cd255d826ad5fbac20e0b1b6b36b"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "oncall"
  target  = "oncall/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "oncall",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "oncall"
  target  = "oncall/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "oncall",
  ]

  sha     = "h1:dbdBaAqH92TwRpz1xub15Fk+cx6LHDNBc9woPAQG0Aw="
  retries = 2
  verbose = false
}
