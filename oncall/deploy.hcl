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

  sha     = "9711625d396f4cbff056bdbc6073882e98b09c898d7a381e84b8ab50028a61a8"
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

  sha     = "h1:v8VU1EJfCg2KhX8y/pTIv38lnTOehdPQ1Mi3m6QcgRs="
  retries = 2
  verbose = false
}
