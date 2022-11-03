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

  sha     = "e717592a9b4311bc0a25687550265d1e30ef5ad34d1f527e3bb4e7007966cc44"
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

  sha     = "h1:mZEXU5LXmpALJzqbBeTw1bp1naxa9rGjNK+fzfJkaqg="
  retries = 2
  verbose = false
}
