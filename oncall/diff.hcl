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

  sha     = "2d25836a8efa94be33b5d4bd15d2e4f6c820c5eb919a217fae370fc2fa121db0"
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

  sha     = "h1:ACRMreb8LPlOEqbEXW5ROCGIo+LZmvC9KnazqJGV08E="
  retries = 0
  verbose = false
}
