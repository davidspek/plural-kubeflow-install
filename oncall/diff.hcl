metadata {
  path = "oncall"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:e0q6Ii6vx9kXmf+P6W++hiYaDApkhkz8BrWzJBTYl8k="
  retries = 0
  verbose = false
}

step "terraform" {
  wkdir   = "oncall/terraform"
  target  = "oncall/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
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
    "oncall",
  ]

  sha     = "9711625d396f4cbff056bdbc6073882e98b09c898d7a381e84b8ab50028a61a8"
  retries = 0
  verbose = false
}

step "helm" {
  wkdir   = "oncall/helm"
  target  = "oncall/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "oncall",
  ]

  sha     = "h1:v8VU1EJfCg2KhX8y/pTIv38lnTOehdPQ1Mi3m6QcgRs="
  retries = 0
  verbose = false
}
