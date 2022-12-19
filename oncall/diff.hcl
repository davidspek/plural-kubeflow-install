metadata {
  path = "oncall"
  name = "diff"
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

  sha     = "d6edaa46fc931424ce794a7455921a3f71c6d7fd7d73fa8b9724908817938b92"
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

  sha     = "h1:VTjXpwWouOz6XT6eW/RFaPK+RphmZTx6idQ/5Q265Xg="
  retries = 0
  verbose = false
}
